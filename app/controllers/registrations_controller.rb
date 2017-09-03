# Class который подменяет пути при попытке регистрации
class RegistrationsController < Devise::RegistrationsController
  def new
    flash[:info] = 'Registrations are not open yet, but you can write me a letter'
    redirect_to root_path
  end

  def create
    flash[:info] = 'Registrations are not open yet, but you can write me a letter'
    redirect_to root_path
  end
end