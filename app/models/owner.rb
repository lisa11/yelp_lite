class Owner < ApplicationRecord
  # Direct associations

  belongs_to :accounts

  belongs_to :restaurants

  # Indirect associations

  # Validations

end
