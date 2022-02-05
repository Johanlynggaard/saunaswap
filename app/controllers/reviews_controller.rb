class ReviewsController < ApplicationController
  # add exception for destroy in the before_action once destroy review ready
  before_action :find_sauna

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.sauna = @sauna
    authorize @review

    if @review.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  # def destroy
  #   @review = Review.find(params[:id])
  #   @review.destroy
  #   redirect_to sauna_path(@review.sauna)
  # end

  private

  def find_sauna
    @sauna = Sauna.find(params[:sauna_id])
    authorize @sauna
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
