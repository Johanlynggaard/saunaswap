class Sauna < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user

  has_many :bookings
  has_many :reviews, dependent: :destroy
  has_many_attached :photos

  validates :title, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :capacity, presence: true
  validates :description, presence: true
  validates :sauna_type, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title_address_description_sauna_type,
    against: [ :title, :address, :description, :sauna_type ],
    using: {
      tsearch: { prefix: true }
    }

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
