class LikeshipsController < ApplicationController
  before_action :authenticate_user!
  include LikeshipsHelper

  def create
    comment_id = params[:likeship][:comment_product_id]
    @comment_product = CommentProduct.find_by id: comment_id
    if current_user.liking?(comment_id).blank?
      @like = current_user.like comment_id
    end
    respond_to do |format|
      format.html{redirect_to correct_url}
      format.js
    end
  end

  def destroy
    comment_id = params[:likeship][:comment_product_id]
    @comment_product = CommentProduct.find_by id: comment_id
    @liking = current_user.liking?(comment_id)
    respond_to do |format|
      if @liking.present?
        current_user.unlike @liking
        format.html{redirect_to correct_url}
      else
        format.html{redirect_to correct_url, notice: t("you_dont_like")}
      end
      format.js
    end
  end
end
