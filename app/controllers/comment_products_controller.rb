class CommentProductsController < ApplicationController
  load_and_authorize_resource
  include CommentProductsHelper
  before_action :find_product, only: [:create, :update, :destroy]
  before_action :find_comment, only: [:update, :destroy]

  def create
    @comment_product = current_user.comment_products.build product: @product,
      content: params[:comment_product][:content]
    respond_to do |format|
      if @comment_product.save
        format.html{redirect_to product_url(@product)}
        format.js
      else
        format.html{redirect_to products_url}
      end
    end
  end

  def update
    respond_to do |format|
      if @comment_product.update_attributes comment_product_params
        flash[:success] = t "cmt_upd_s"
        format.js
      else
        flash[:error] = t "cmt_upd_f"
      end
      format.html{redirect_to product_url(@product)}
    end
  end

  def destroy
    @comment_product.destroy
    respond_to do |format|
      format.html{redirect_to product_url(@product)}
      format.js
    end
  end

  private
  def comment_product_params
    params.require(:comment_product).permit :id, :content,
      :user_id, :product_id
  end

  def find_comment
    @comment_product = CommentProduct.find_by id: params[:id]
    unless @comment_product
      flash[:error] = t "comment_not_found"
      redirect_to products_url
    end
  end
end
