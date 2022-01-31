class SaunasController < ApplicationController
  def index
    @saunas = Sauna.all
  end

  def show
    @sauna = Sauna.find(params[:id])
  end
end
