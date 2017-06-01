module LikeshipsHelper
  def correct_url
    if params[:comment_product_id].present?
      product = CommentProduct.find_by(id: comment_product_id).product
      product_url product
    else
      root_url
    end
  end
end
