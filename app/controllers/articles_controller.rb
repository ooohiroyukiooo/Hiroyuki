class ArticlesController < ApplicationController

  before_filter :login_required
  
  def show
  end
  
  
  def edit
    @articles = Article.find(params[:id])
  end
  
  def update
    @articles = Article.find(params[:id])
    @articles.assign_attributes(article_params)
    if @articles.save
      redirect_to :root, notice: "更新しました"
    else
      render "edit"
    end
  end
  
  def new
    @articles = Article.new
  end

  def create
    @articles = Article.new(article_params)
    if @articles.save
      redirect_to :root
    else
      render 'new'
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to :root, notice: "会員を削除しました。"
  end
  
  private
  def article_params
    params.require(:article).permit(
    :title,
    :name,
    :content
    )
  end
end
