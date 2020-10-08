class StoresController < ApplicationController
  before_action :find_store, only: [:show, :edit, :update, :destroy]
  def index
    @stores = Store.all
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to stores_path
    end
  end

  def show
  end

  def edit
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
    params.require(:store).permit(:name,:address, :contact, :line_name, :station, :minutes_on_foot, :link, :open_closed, :regular_holiday, :note, :latitude, :longitude)
  end

  def find_store
    @store = Store.find(params[:id])
  end
end
