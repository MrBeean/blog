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
end