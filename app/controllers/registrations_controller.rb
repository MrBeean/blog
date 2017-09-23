# Class который подменяет пути при попытке регистрации
class RegistrationsController < Devise::RegistrationsController
  def new
    flash[:info] = I18n.t('controllers.registrations.closed.')
    redirect_to root_path
  end

  def create
    flash[:info] = I18n.t('controllers.registrations.closed.')
    redirect_to root_path
  end

  protected

  def after_update_path_for(resource)
    user_path(resource)
  end
end