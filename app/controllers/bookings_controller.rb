class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.sauna = Sauna.find(params[:sauna_id])

    if @booking.save
      redirect_to booking_path(@booking)
    else
      redirect_to sauna_path(@sauna)
    end
  end

  private
  def booking_params
    params[:booking].permit(:start_date, :end_date)
  end
end
