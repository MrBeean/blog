class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  # Хелпер метод, доступный во вьюхах
  helper_method :current_user_can_edit?, :can_edit_user?

  # Настройка для девайза — разрешаем обновлять профиль, но обрезаем
  # параметры, связанные со сменой пароля.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [:password, :password_confirmation, :current_password, :name]
    )
  end

  # Вспомогательный метод, возвращает true, если текущий залогиненный юзер
  # может править указанную модель
  def current_user_can_edit?(model)
    # Если у модели есть юзер и он залогиненный, пробуем у модели взять .post и
    # если он есть, проверяем его юзера на равенство current_user.
    user_signed_in? && (
    model.user == current_user ||
      (model.try(:post).present? && model.user == current_user)
    )
  end

  def can_edit_user?(user)
    user_signed_in? && current_user == (user)
  end
end
