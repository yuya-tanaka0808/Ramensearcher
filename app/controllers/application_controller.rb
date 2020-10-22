class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # ログイン後、stores/indexに移動する
  def after_sign_in_path_for(resource)
    stores_path
  end

  def admin_required
    unless current_user.admin?
      flash[:notice] = t('notice.admin_needed')
      redirect_to stores_path
    end
  end

  def login_required
    if current_user == nil
      flash[:notice] = t('notice.login_needed')
      redirect_to "/users/sign_in"
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
