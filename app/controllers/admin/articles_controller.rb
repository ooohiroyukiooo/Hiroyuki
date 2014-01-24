class Admin::ArticlesController < ApplicationController

  def show
    @articles = find(params[:id])
  end

  def new
    @articles = Article.new
  end

  def edit
    @articles = Article.find(params[:id])
  end

def create
    @articles = Article.new(article_params)
    if @articles.save
      redirect_to :admin_root
    else
      render 'new'
    end
  end

  def update
    @articles = Article.find(params[:id])
    @articles.assign_attributes(article_params)
    if @articles.save
      redirect_to :admin_root, notice: "更新しました"
    else
      render "edit"
    end
  end

   def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to :admin_root, notice: "会員を削除しました。"
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
