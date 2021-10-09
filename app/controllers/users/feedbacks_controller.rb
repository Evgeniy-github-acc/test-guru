class Users::FeedbacksController < ApplicationController

  before_action :authenticate_user!

  def new
  
  end

  def create
    @message = params[:message]
    FeedbackMailer.send_feedback(current_user, @message).deliver_later
    redirect_back(fallback_location: root_path)
  end
end
