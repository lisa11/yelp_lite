class Review < ApplicationRecord
  # Direct associations

  has_many   :photos,
             :foreign_key => "reviews_id",
             :dependent => :destroy

  belongs_to :restaurants

  # Indirect associations

  # Validations

end
