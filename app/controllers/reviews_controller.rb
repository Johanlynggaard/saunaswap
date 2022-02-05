class ReviewsController < ApplicationController
  before_action :find_sauna

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @raview.user = current_user
    @review.sauna = @sauna
    authorize @review

    if @review.save
      redirect_to user_path
    else
      render :new
    end
  end

  private

  def find_sauna
    @sauna = Sauna.find(params[:sauna_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
