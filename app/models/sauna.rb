class Sauna < ApplicationRecord
  belongs_to :user

  has_many :bookings

  has_many_attached :photos

  validates :title, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :capacity, presence: true
  validates :description, presence: true
  validates :sauna_type, presence: true
end
