class UsersController < ApplicationController
  before_action :login_required
  def show
    @user = current_user
    @favorites = Favorite.where(user_id: @user.id)
  end
end
