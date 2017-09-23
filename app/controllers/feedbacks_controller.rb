class FeedbacksController < ApplicationController
  before_action :set_user, only: [:create]

  def create
    @feedback = @user.feedbacks.build(feedback_params)
    @feedback.user = @user

    if check_captcha(@feedback) && @feedback.save
      redirect_to @user, notice: I18n.t('controllers.feedbacks.created')
      FeedbackMailer.feedback(@feedback).deliver_now
    else
      render 'users/show', alert: I18n.t('controllers.feedbacks.error')
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def feedback_params
    params.require(:feedback).permit(:name, :email, :message)
  end

  def check_captcha(feedback)
    if current_user.present?
      true
    else
      verify_recaptcha(model: feedback, message: I18n.t('controllers.feedbacks.recaptcha.error'))
    end
  end
end
