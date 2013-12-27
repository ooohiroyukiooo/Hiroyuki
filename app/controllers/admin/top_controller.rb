class Admin::TopController < Admin::Base
  before_filter :authenticate_administrator

  def index
    @articles = Article.all
  end

end
