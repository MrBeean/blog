class FeedbacksController < ApplicationController
  before_action :set_user, only: [:create]

  def create
    @feedback = @user.feedbacks.build(feedback_params)
    @feedback.user = @user

    if @feedback.save
      redirect_to @user, notice: I18n.t('controllers.feedbacks.created')
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
end
