class Residence < ActiveRecord::Base
    has_many :images
    belongs_to :landlord
    attr_accessible :visible, :address, :address2, :latitude, :longitude, :city, :state, :zipcode, :slug, :restype, :bedrooms_available, :bedrooms_total, :bathrooms, :miles_from_campus, :total_monthly_rent, :arrangement, :contact, :description, :notes, :furnishing, :parking, :available, :lease_term, :security_deposit, :security_deposit_refundable, :heating_type, :am_laundry, :am_coin_op_laundry, :am_extra_storage, :am_cable_tv, :am_smoking_allowed, :am_smoke_detector, :am_ada_accessible, :am_internet_included, :am_stove, :am_refrigerator, :am_dishwasher, :am_lawn_care_included, :am_water_included, :am_sewer_included, :am_garbage_included, :am_electricity_included

    # leaving this line in as a FUCK-YOU monument
    # dk what i was thinking but this cost me 40 minutes
    
    # attr_writer :latitude, :longitude

    geocoded_by :full_street_address
    after_validation :geocode

    def full_street_address
        [address, address2, city, state, zipcode].compact.join(",")
    end

    def default_image
        Image.where(residence_id: self.id, is_default: true).first
    end

    def self.res_types
        ["Apartment", "House"]
    end

    def self.arrangements
        ["To Rent", "To Share"]
    end

    def self.max_bedrooms
        10
    end

    def self.miles_options
        [0.5, 1, 2, 3, 5, 10]
    end

    def self.get_amenities
         {"am_laundry" => "Laundry",
            "am_coin_op_laundry" => "Coin-Operated Laundry",
            "am_extra_storage" => "Extra Storage",
            "am_cable_tv" => "Cable TV Included",
            "am_smoking_allowed" => "Smoking Allowed",
            "am_smoke_detector" => "Smoke Detector",
            "am_ada_accessible" => "ADA Accessible",
            "am_internet_included" => "Internet Included",
            "am_stove" => "Stove",
            "am_refrigerator" => "Refrigerator",
            "am_dishwasher" => "Dishwasher",
            "am_lawn_care_included" => "Lawn Care Included",
            "am_water_included" => "Water Included",
            "am_sewer_included" => "Sewer Included",
            "am_garbage_included" => "Garbage Included",
            "am_electricity_included" => "Electricity Included"}
    end

    def custom_label_method
        "#{self.address} #{self.address2} #{self.zipcode}"
    end

    rails_admin do
        object_label_method do
            :custom_label_method
        end

        list do
            field :id
            field(:address)                 { label "Address" }
            field(:zipcode)                 { label "Zip" }
            field(:restype)                 { label "Type" }
            field(:bedrooms_total)          { label "Bedrooms" }
            field(:total_monthly_rent)      { label "Rent" }
        end

        edit do
            group :location do
                label "Location Data"
            end

            group :basic_info do
                label "Basic Information"
            end

            group :desc do
                label "Descriptions"
            end

            group :money do
                label "Financial"
            end

            group :amenities do
                label "Amenities"
            end

            field :address do
                label "Address"
                group :location
            end

            field :address2 do
                label "Address2"
                group :location
            end

            field :city do
                label "City"
                group :location
            end

            field :state do
                label "State"
                group :location
            end

            field :zipcode do
                label "Zip"
                group :location
            end

            field :restype do
                label "Residence Type"
                group :basic_info
            end

            field :bedrooms_available do
                label "Bedroom count (currently available)"
                group :basic_info
            end

            field :bedrooms_total do
                label "Bedroom count (total)"
                group :basic_info
            end

            field :bathrooms do
                label "Number of bathrooms"
                group :basic_info
            end

            field :miles_from_campus do
                label "Miles from campus"
                group :basic_info
            end

            field :total_monthly_rent do
                label "Total monthly rent"
                group :basic_info
            end

            field :arrangement do
                label "Arrangement"
                group :basic_info
            end

            field :description do
                label "Description"
                group :desc
            end

            field :notes do
                label "Notes"
                group :desc
            end

            field :furnishing do
                label "Furnishing Info"
                group :desc
            end

            field :security_deposit do
                label "Security deposit"
                group :money
            end

            field :security_deposit_refundable do
                label "Security deposit (refundable)"
                group :money
            end

            field :heating_type do
                label "Heating type"
                group :amenities
            end

            field :am_laundry do
                label "Laundry"
                group :amenities
            end

            field :am_coin_op_laundry do
                label "Coin-operated laundry"
                group :amenities
            end

            field :am_extra_storage do
                label "Extra storage"
                group :amenities
            end

            field :am_cable_tv do
                label "Cable TV"
                group :amenities
            end

            field :am_smoking_allowed do
                label "Smoking allowed"
                group :amenities
            end

            field :am_smoke_detector do
                label "Smoke detector"
                group :amenities
            end

            field :am_ada_accessible do
                label "ADA accessible"
                group :amenities
            end

            field :am_internet_included do
                label "Internet included"
                group :amenities
            end

            field :am_stove do
                label "Stove"
                group :amenities
            end

            field :am_refrigerator do
                label "Refrigerator"
                group :amenities
            end

            field :am_dishwasher do
                label "Dishwasher"
                group :amenities
            end

            field :am_lawn_care_included do
                label "Lawn care included"
                group :amenities
            end

            field :am_water_included do
                label "Water included"
                group :amenities
            end

            field :am_sewer_included do
                label "Sewer included"
                group :amenities
            end

            field :am_garbage_included do
                label "Garbage included"
                group :amenities
            end

            field :am_electricity_included do
                label "Electricity included"
                group :amenities
            end
        end

        configure(:restype)                 { label "Type" }

        configure(:am_laundry)              { label "Laundry" }
        configure(:am_coin_op_laundry)      { label "Coin-Operated Laundry" }
        configure(:am_extra_storage)        { label "Extra Storage" }
        configure(:am_cable_tv)             { label "Cable TV Included" }
        configure(:am_smoking_allowed)      { label "Smoking Allowed" }
        configure(:am_smoke_detector)       { label "Smoke Detector" }
        configure(:am_ada_accessible)       { label "ADA Accessible" }
        configure(:am_internet_included)    { label "Internet Included" }
        configure(:am_stove)                { label "Stove" }
        configure(:am_refrigerator)         { label "Refrigerator" }
        configure(:am_dishwasher)           { label "Dishwasher" }
        configure(:am_lawn_care_included)   { label "Lawn Care Included" }
        configure(:am_water_included)       { label "Water Included" }
        configure(:am_sewer_included)       { label "Sewer Included" }
        configure(:am_garbage_included)     { label "Garbage Included" }
        configure(:am_electricity_included) { label "Electricity Included" }
    end

end
