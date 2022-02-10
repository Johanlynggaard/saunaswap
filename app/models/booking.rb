class Booking < ApplicationRecord
  belongs_to :sauna
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true


  # validates :status, inclusion: { in: %w(accepted rejected nil),
  #   message: "%{value} is not a valid status" }

  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
