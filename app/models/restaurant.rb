class Restaurant < ApplicationRecord
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
