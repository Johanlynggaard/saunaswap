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
    # We need to add photos: [] to strong params list once upload images for is ready
    params.require(:sauna).permit(:title, :address, :price, :capacity,  :description, :sauna_type)
  end

end
