class FeedbackMailer < ApplicationMailer

  def send_feedback(user, message)
    @user = user
    @message = message

    mail to: Admin.first.email
  end  
end
