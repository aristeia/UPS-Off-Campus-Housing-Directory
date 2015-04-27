class Image < ActiveRecord::Base
  mount_uploader :file_location, ImageUploader

  attr_accessible :residence_id, :file_location, :is_default, :file_location_cache, :remove_file_location
  belongs_to :residence

  before_validation :check_defaults

  def check_defaults
    if self.is_default != false and self.is_default != true
      self.is_default = false
    end

    if self.is_default
      Image.where(residence_id: self.residence_id, is_default: true).each do |img|
        img.is_default = false
        img.save
      end
    end
  end

  rails_admin do
    list do
      field :id
      field(:file_location)           { label "Image" }
      field(:residence)               { label "Associated Residence" }
      field(:is_default)              { label "Primary Image for Residence" }
    end

    configure :file_location do
      label "Image"
    end

    configure :residence do
      label "Associated Residence"
    end

    configure :is_default do
      label "Make primary image"
    end
  end
end

