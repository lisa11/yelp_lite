class Restaurant < ApplicationRecord
  # Direct associations

  has_many   :reviews,
             :foreign_key => "restaurants_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
