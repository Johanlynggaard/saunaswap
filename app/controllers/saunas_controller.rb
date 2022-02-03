class SaunasController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_sauna, only: [:show, :edit, :update, :destroy]

  def index
    @saunas = policy_scope(Sauna).order(created_at: :desc)
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

  private

  def sauna_params
    params.require(:sauna).permit(:title, :address, :price, :capacity, :photo, :description, :sauna_type)
  end

  def set_sauna
    @sauna = Sauna.find(params[:id])
    authorize @sauna
  end
end
