class Admin::SessionsController < Admin::Base

  def new
  end

  def create
    if admin = AdminPasswordAuthenticator.verify(params[:login_name], params[:password])
      if admin.deleted_at == nil
        session[:current_admin_id] = admin.id
        redirect_to :admin_root
      else
        flash.now.alert = "ログイン名またはパスワードが違います。"
        render action: :new
      end
    else
      flash.now.alert = "ログイン名またはパスワードが違います。"
      render action: :new
    end
  end

  def destroy
    session.delete(:current_admin_id)
    redirect_to :admin_root
  end

end
