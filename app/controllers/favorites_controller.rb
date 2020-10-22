class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(store_id: params[:store_id])
    redirect_to store_path(favorite.store.id), notice: t('view.models.favorite.created')
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to store_path(favorite.store.id), notice: t('view.models.favorite.deleted')
  end
end
