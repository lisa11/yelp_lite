class Tag < ApplicationRecord
  # Direct associations

  has_many   :filters,
             :dependent => :destroy

  # Indirect associations

  has_many   :restaurants,
             :through => :filters,
             :source => :restaurants

  # Validations

end
