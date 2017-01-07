class Response < ApplicationRecord
  # Direct associations

  belongs_to :owners

  belongs_to :reviews

  # Indirect associations

  # Validations

end
