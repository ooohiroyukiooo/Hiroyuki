class TopsController < ApplicationController
  def index
    @articles = Article.all
  end

end
