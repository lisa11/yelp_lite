class Restaurant < ApplicationRecord
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

  # Validations

end
