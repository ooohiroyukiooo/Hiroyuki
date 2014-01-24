class Admin::AdministratorsController < ApplicationController
  def index
    @admins = Administrator.active.order("created_at DESC")
  end

  def show

  end

  def new
    @admin = Administrator.new
  end

  def edit
    @admin = Administrator.active.find(params[:id])
  end

  def create
    @admin = Administrator.new(admin_new_params)
    @admin.setting_password = true
    if @admin.save
      flash.notice =  "管理者を登録しました。"
      redirect_to  [ :admin, :administrators ]
    else
      flash.now.alert = "登録できませんでした。"
      render "new"
    end
  end

  def update
    @admin = Administrator.find(params[:id])
    @admin.assign_attributes(admin_edit_params)
    if @admin.save
      flash.notice =  "管理者の登録情報を更新しました。"
      redirect_to  [ :admin, :administrators ]
    else
      flash.now.alert = "更新できませんでした。"
      render "edit"
    end
  end
end
