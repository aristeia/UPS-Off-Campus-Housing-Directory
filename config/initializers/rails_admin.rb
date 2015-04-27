# RailsAdmin config file. Generated on October 24, 2014 12:13
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|


  ################  Global configuration  ################

  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['Ps Off Campus Housing', 'Admin']
  # or for a more dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  # RailsAdmin may need a way to know who the current user is]
  config.current_user_method { current_user } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, 'User'

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, 'User'

  # Display empty fields in show views:
  # config.compact_show_view = false

  # Number of default rows per-page:
  # config.default_items_per_page = 20

  # Exclude specific models (keep the others):
  # config.excluded_models = ['Landlord', 'Residence']

  # Include specific models (exclude the others):
  # config.included_models = ['Landlord', 'Residence']
  config.included_models = ['Finance', 'Image', 'Landlord', 'Residence', 'Review', 'StudentUser', 'User']

  # Label methods for model instances:
  # config.label_methods << :description # Default is [:name, :title]

  config.authorize_with do |controller|
    #if not current_user.member_of == "admin"
    #  flash[:error] = "You are not an admin"
    #  redirect_to '/'
    #end
  end



  ################  Model configuration  ################

  # Each model configuration can alternatively:
  #   - stay here in a `config.model 'ModelName' do ... end` block
  #   - go in the model definition file in a `rails_admin do ... end` block

  # This is your choice to make:
  #   - This initializer is loaded once at startup (modifications will show up when restarting the application) but all RailsAdmin configuration would stay in one place.
  #   - Models are reloaded at each request in development mode (when modified), which may smooth your RailsAdmin development workflow.


  # Now you probably need to tour the wiki a bit: https://github.com/sferik/rails_admin/wiki
  # Anyway, here is how RailsAdmin saw your application's models when you ran the initializer:


  #config.model 'Residence' do
  #  object_label_method do
  #    :custom_label_method
  #  end
  #end
#
  #def custom_label_method
  #  "Team #{self.address}"
  #end

  #config.model 'Image' do
  #  configure :residence_id, :integer
  #  configure :file_location, :string
  #  configure :is_default, :boolean
  #  field :file_location do
  #    thumb_method :thumb
  #    delete_method :asset_delete
  #    cache_method :asset_cache
  #  end
  #end


  ###  Landlord  ###

  # config.model 'Landlord' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your landlord.rb model definition

  #   # Found associations:



  #   # Found columns:

  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :email, :string 
  #     configure :phone1, :string 
  #     configure :phone2, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Residence  ###

  # config.model 'Residence' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your residence.rb model definition

  #   # Found associations:



  #   # Found columns:

  #     configure :id, :integer 
  #     configure :address, :string 
  #     configure :address2, :string 
  #     configure :city, :string 
  #     configure :state, :string 
  #     configure :zipcode, :string 
  #     configure :slug, :string 
  #     configure :restype, :string 
  #     configure :bedrooms_available, :string 
  #     configure :bedrooms_total, :string 
  #     configure :bathrooms, :string 
  #     configure :miles_from_campus, :float 
  #     configure :total_monthly_rent, :integer 
  #     configure :arrangement, :string 
  #     configure :description, :text 
  #     configure :notes, :text 
  #     configure :furnishing, :text 
  #     configure :parking, :string 
  #     configure :available, :date 
  #     configure :lease_term, :string 
  #     configure :security_deposit, :integer 
  #     configure :security_deposit_refundable, :integer 
  #     configure :heating_type, :string 
  #     configure :am_laundry, :boolean 
  #     configure :am_coin_op_laundry, :boolean 
  #     configure :am_extra_storage, :boolean 
  #     configure :am_cable_tv, :boolean 
  #     configure :am_smoking_allowed, :boolean 
  #     configure :am_smoke_detector, :boolean 
  #     configure :am_ada_accessible, :boolean 
  #     configure :am_internet_included, :boolean 
  #     configure :am_stove, :boolean 
  #     configure :am_refrigerator, :boolean 
  #     configure :am_dishwasher, :boolean 
  #     configure :am_lawn_care_included, :boolean 
  #     configure :am_water_included, :boolean 
  #     configure :am_sewer_included, :boolean 
  #     configure :am_garbage_included, :boolean 
  #     configure :am_electricity_included, :boolean 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end

end
