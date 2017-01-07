class Review < ApplicationRecord
  # Direct associations

  belongs_to :account

  has_many   :responses,
             :foreign_key => "reviews_id",
             :dependent => :destroy

  has_many   :photos,
             :foreign_key => "reviews_id",
             :dependent => :destroy

  belongs_to :restaurants

  # Indirect associations

  has_many   :owners,
             :through => :responses,
             :source => :owners

  # Validations

end
