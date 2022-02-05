class BookingsController < ApplicationController
  before_action :set_sauna, only: [ :new, :create ]

  def index
    # @bookings = current_user.bookings
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.sauna = @sauna
    authorize @booking

    if @booking.save
      redirect_to saunas_path, notice: "Your booking has been completed 🎉"
    else
      render :new
    end
  end

  private
  def booking_params
    params[:booking].permit(:start_date, :end_date, :sauna_id)
  end

  def set_sauna
    @sauna = Sauna.find(params[:sauna_id])
  end

end
