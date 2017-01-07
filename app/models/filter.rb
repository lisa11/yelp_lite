class Filter < ApplicationRecord
  # Direct associations

  belongs_to :tag

  belongs_to :restaurants

  # Indirect associations

  # Validations

end
