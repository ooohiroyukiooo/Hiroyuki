class UsersController < ApplicationController

  def show
    @user = @current_user
  end
  
  def edit
    @user = @current_user
  end
  
  def update
    @user.setting_password = true
    @user.assign_attributes(params[:password])
    if @user.save
      flash.notice =  "パスワードを更新しました。"
      redirect_to :edit_user
    else
      flash.now.alert = "更新できませんでした。"
      render "edit"
    end
  end
  
end


