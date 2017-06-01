class Admin::FeedbacksController < ApplicationController
  load_and_authorize_resource

  def index
    @feedbacks = Feedback.newest
  end

  def show
  end

  def destroy
    @feedback.destroy
    flash[:success] = t "fb_destroy_success"
    redirect_to feedbacks_url
  end
end
