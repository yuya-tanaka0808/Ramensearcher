class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    @user = current_user
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to store_path(@review.store.id),notice: "レビューしました！"
    else
      flash.now[:notice] = 'レビューに失敗しました！'
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to store_path(@review.store.id), notice: "review updated!"
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to stores_path
  end
  private
  def review_params
    params.require(:review).permit(:rating, :comment, :user_id, :store_id)
  end
end