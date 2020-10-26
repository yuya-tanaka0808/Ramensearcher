class ReviewsController < ApplicationController
  before_action :find_review, only: [:edit, :update, :destroy]
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    @user = current_user
  end

  def create
    @review = Review.new(review_params)
    @store = @review.store
    if @review.save
      redirect_to store_path(@store.id),notice: t('view.models.review.reviewed')
    else
      render template: "stores/show"
    end
  end

  def edit
    @review = Review.find(params[:id])
    @store = @review.store
  end

  def update
    if @review.update(review_params)
      redirect_to store_path(@review.store.id), notice: t('view.models.review.updated')
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to store_path(@review.store.id)
  end
  private
  def review_params
    params.require(:review).permit(:rating, :comment, :user_id, :store_id, :image)
  end
  def find_review
    @review = Review.find(params[:id])
  end
end
