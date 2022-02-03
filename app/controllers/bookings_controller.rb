class BookingsController < ApplicationController
  def index
    # @bookings = current_user.bookings
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @sauna = Sauna.find(params[:sauna_id])
    @booking = Booking.new
    authorize @booking

  end

  def create
    @booking = Booking.new(booking_params)


    @booking.user = current_user
    @sauna = Sauna.find(params[:sauna_id])

    @booking.sauna = @sauna
    authorize @booking

    if @booking.save
      redirect_to saunas_path
    else
      render :new
    end
  end

  private
  def booking_params
    params[:booking].permit(:start_date, :end_date)
  end
end
