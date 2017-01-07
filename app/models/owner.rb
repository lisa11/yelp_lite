class Owner < ApplicationRecord
  # Direct associations

  has_many   :responses,
             :foreign_key => "owners_id",
             :dependent => :destroy

  belongs_to :accounts

  belongs_to :restaurants

  # Indirect associations

  has_many   :reviews,
             :through => :responses,
             :source => :reviews

  # Validations

end
