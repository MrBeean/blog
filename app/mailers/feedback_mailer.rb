class FeedbackMailer < ApplicationMailer
  def feedback(message)
    @name = message.name
    @author_email = message.email
    @message = message.message
    @date = message.created_at.strftime('%-d.%-m.%Y в %H:%M')

    mail to: message.user.email, subject: 'Новое сообщение от пользователя'
  end
end
