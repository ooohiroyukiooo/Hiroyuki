# coding: utf-8

class Admin::Base < ApplicationController
  before_filter :admin_login_required
  
  private
  def admin_login_required
  
  end
end
