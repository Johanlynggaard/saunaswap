class SaunasController < ApplicationController
  def index
    @saunas = Sauna.all
  end
end
