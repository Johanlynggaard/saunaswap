class ReviewsController < ApplicationController
  before_action :find_sauna

  def new
    @review = Review.new
  end

  def create

  end

  private

  def find_sauna
    @sauna = Sauna.find(params[:sauna_id])
  end
end
