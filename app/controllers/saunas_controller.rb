class SaunasController < ApplicationController
  def index
    @saunas = Sauna.all
  end

  def show
    @sauna = Sauna.find(params[:id])
  end

  def new
    @sauna = Sauna.new
  end

  def create
    @sauna = Sauna.new(sauna_params)
    @sauna.user = current_user
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

end
