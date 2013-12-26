class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :current_user

  private
  def current_user
    if session[:user_id]
      @current_user = User.find_by_id(session[:user_id])
      session.delete(:user_id) unless @current_user
    end
  end

  def login_required
    redirect_to :new_session unless @current_user
  end

  def current_admin
    if session[:current_admin_id]
      @current_admin = Administrator.find_by_id(session[:current_admin_id])
      session.delete(:current_admin_id) unless @current_admin
    end
    @current_admin
  end

  def authenticate_administrator
    unless current_admin
      redirect_to [ :new, :admin, :session ]
    end
  end


end
