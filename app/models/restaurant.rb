class Restaurant < ApplicationRecord
  before_validation :geocode_address

  def geocode_address
    if self.address.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.address)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.address_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.address_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.address_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  mount_uploader :cover_photo, CoverPhotoUploader

  # Direct associations

  has_many   :owners,
             :foreign_key => "restaurants_id",
             :dependent => :destroy

  has_many   :filters,
             :foreign_key => "restaurants_id",
             :dependent => :destroy

  has_many   :reviews,
             :foreign_key => "restaurants_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :tags,
             :through => :filters,
             :source => :tag

  # Validations

end
