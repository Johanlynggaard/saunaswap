class SaunasController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_sauna, only: [:show, :edit, :update, :destroy]

  def index
    @saunas = policy_scope(Sauna).order(created_at: :desc)
    @markers = @saunas.geocoded.map do |sauna|
      {
        lat: sauna.latitude,
        lng: sauna.longitude,
        info_window: render_to_string(partial: "/saunas/map_pin_box", locals: { sauna: sauna })
      }
    end
  end

  def show
  end

  def new
    @sauna = Sauna.new
    authorize @sauna
  end

  def create
    @sauna = Sauna.new(sauna_params)
    @sauna.user = current_user
    authorize @sauna
    if @sauna.save
      redirect_to sauna_path(@sauna)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @sauna.update(sauna_params)
      redirect_to sauna_path(@sauna)
    else
      render :edit
    end
  end

  def destroy
    @sauna.destroy
    redirect_to saunas_path
  end

  private

  def sauna_params
    params.require(:sauna).permit(:title, :address, :price, :capacity, :description, :sauna_type, photos: [])
  end

  def set_sauna
    @sauna = Sauna.find(params[:id])
    authorize @sauna
  end
end
