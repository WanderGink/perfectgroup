class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: [:show, :destroy]

  def index
    #@users = User.all.paginate page: params[:page]
    if params[:search].present?
      @users = User.search(params[:search])
    else
      @users = User.all.paginate page: params[:page]
    end
  end

  def show
    @products = @user.products
    if current_user.following? @user
      @following = current_user.active_relationships
        .find_by followed_id: @user.id
    else
      @following = current_user.active_relationships.build
    end
  end

  def destroy
    @user.destroy
    flash[:success] = t ".complete"
    redirect_to root_url
  end

  private
  def find_user
    @user = User.find_by id: params[:id]
    unless @user
      redirect_to root_url
      flash[:danger] = t ".flash"
    end
  end
end
