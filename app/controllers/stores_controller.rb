class StoresController < ApplicationController
  before_action :find_store, only: [:show, :edit, :update, :destroy]
  before_action :admin_required, only: [:new, :edit, :destroy]
  def index
    @q = Store.ransack(params[:q])
    @stores = @q.result(distinct: true)
  end

  def new
    @store = Store.new
    5.times { @store.menus.build }
    2.times { @store.openings.build }
    @store.images.build
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to stores_path
    else
      render :new
    end
  end

  def show
    unless @current_user == nil
      @favorite = current_user.favorites.find_by(store_id: @store.id)
    end
    @reviews = Review.where(store_id: @store.id)
    @review = @store.reviews.build
  end

  def edit
    5.times { @store.menus.build }
    2.times { @store.openings.build }
    @store.images.build
  end

  def update
    if @store.update(store_params)
      redirect_to store_path(@store.id), notice: "store updated!"
    else
      render :edit
    end
  end

  def destroy
    @store.destroy
    redirect_to stores_path
  end

  private
  def store_params
    params.require(:store).permit(
      :name,
      :address,
      :contact,
      :line_name,
      :station,
      :minutes_on_foot,
      :link, :open_closed,
      :regular_holiday,
      :note,
      :latitude,
      :longitude,
      menus_attributes: [
        :name,
        :price,
        :taste,
        :store_id,
        :id,
        :_destroy
      ],
      openings_attributes: [
        :open_hour,
        :last_order,
        :day_week,
        :weeks,
        :store_id,
        :id,
        :_destroy
      ],
      images_attributes: [
        :image,
        :store_id,
        :id,
        :_destroy
      ],
    )
  end

  def find_store
    @store = Store.find(params[:id])
  end
end
