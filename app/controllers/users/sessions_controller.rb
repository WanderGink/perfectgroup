class Users::SessionsController < Devise::SessionsController
  def create
    @user = User.find_by email: params[:user][:email]
    if @user.present?
      if @user.bye?
        flash[:error] = t "user_locked"
        redirect_to user_session_path
      else
        super
      end
    else
      flash[:error] = "ko ton tai"
      redirect_to user_session_path
    end
  end
end
