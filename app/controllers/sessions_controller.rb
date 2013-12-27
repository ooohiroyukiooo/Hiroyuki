class SessionsController < ApplicationController
  skip_before_filter :authenticate_user

  def new
  end

  def create
    user = User.authenticate(params[:login_name], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to :root
    else
      flash.alert = "名前とパスワードが一致しません。"
      render "new"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to :root
  end

end
