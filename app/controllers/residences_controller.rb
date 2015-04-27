class ResidencesController < ApplicationController

  def update
    id = params[:id]
    @residence = Residence.find(id)
    params[:residence].each do |par, val|
	      #print "YOLO"+(defined? temp).to_str
        #print "YOLO"+eval(temp).to_str
      eval("@residence."+par+" = val")
      #print eval(temp)
    end
    @residence.save
    redirect_to dashboard_path
  end  


  def show
    id = params[:id]
    unless id.nil?
        @residence = Residence.find(id)
        @landlord = Landlord.find(@residence.landlord_id) unless @residence.nil?
        @amenities = []
        # Compile the list of amenities to display on the page
        Residence.get_amenities.each do |amenity, name|
            if @residence[amenity]
                @amenities << name
            end
        end
    end

    # Get the images
    @primary_image = Image.where(residence_id: @residence.id, is_default: true).first
    @other_images = Image.where(residence_id: @residence.id, is_default: false)

    # Don't render with the header if it's an ajax call
    if params[:format] == "ajax"
        render "residences/show", :layout => false
    end
  end

    # The string to be displayed for the "Any" option in forms
    @@anyMarker = "Any"

    def search
        @residences = Residence.find(:all);
        # Add the "Any" option to the residence and arrangement type selector
        @restypes = Residence.res_types.unshift @@anyMarker
        @arrangements = Residence.arrangements.unshift @@anyMarker

        #Create options up to the maximum possible bedrooms available
        @bedrooms = []
        1.upto(Residence.max_bedrooms) { |rooms| @bedrooms << rooms }

        @miles_options = Residence.miles_options
        @amenities = Residence.get_amenities;

        @checked_amenities = []
        @selected = Hash.new

        search = session[:search]

        if !search.nil?
            search.each do |key, value|
                #Determine amenities to select
                 if key.start_with? "am_"
                    @checked_amenities << key
                 else
                    @selected[key.to_sym] = value
                 end
            end
        end
    end

    def index
        # Only display the map hint if it hasn't been displayed before
        @display_hint = (session[:display_hint].nil? || session[:display_hint]) ? "block" : "none"
        session[:display_hint] = false;

        # If there aren't search criteria, show all residences
        if params[:search].nil?
          @residences = Residence.find(:all)
        else
          search = params[:search]
          session[:search] = search

          searchString = ""
          searchArray = Array.new

          search.each do |key, value|
            if key.start_with? "am_"
              searchString << "#{key} = ? AND "
              searchArray << true
            end
          end

          if search[:restype] != @@anyMarker
            searchString << "restype = ? AND "
            searchArray << search[:restype]
          end

          if search[:total_monthly_rent] != ""
            searchString << "total_monthly_rent <= ? AND "
            searchArray << search[:total_monthly_rent].to_i
          end

          searchString << "bedrooms_available >= ? AND miles_from_campus <= ?"
          searchArray << search[:bedrooms_available].to_i
          searchArray << search[:miles_from_campus].to_f

          searchArray.unshift searchString

          @residences = Residence.where searchArray

        end

    end

end
