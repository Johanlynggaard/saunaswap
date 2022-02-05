class Review < ApplicationRecord
  belongs_to :sauna

  validates :content, presence: true, length: { minimum: 50, maximum: 500 }
  validates :rating, presence: true
end
