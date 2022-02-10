class BookingsController < ApplicationController
  before_action :set_sauna, only: [ :new, :create, :edit, :update]
  before_action :set_booking, only: [:show, :edit, :update]

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def show
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

  def edit
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    authorize @booking
    redirect_to profile_path, notice: "Booking updated"
  end

  private
  def booking_params
    params[:booking].permit(:start_date, :end_date, :sauna_id, :status)
  end

  def set_sauna
    @sauna = Sauna.find(params[:sauna_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
