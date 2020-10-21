class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(store_id: params[:store_id])
    redirect_to store_path(favorite.store.id), notice: "#{favorite.store.name}をお気に入り登録しました"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to store_path(favorite.store.id), notice: "#{favorite.store.name}をお気に入り解除しました"
  end
end
