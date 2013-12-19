class TopsController < ApplicationController

  before_filter :login_required

  def index
    @articles = Article.all
  end

end
