class Booking < ApplicationRecord
  belongs_to :sauna
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true

  validates :status, inclusion: { in: %w(accepted rejected),
    message: "%{value} is not a valid status" }
end
