class ArticlesController < ApplicationController
  require 'kramdown'

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index #article
    @articles = Article.all
  end

  def show #article/id
    # @article
    # @md = Kramdown::Document.new(@article.content).to_html.html_safe
  end

  def new #article/new
    @article = Article.new
  end

  def create #article
    article = Article.create(article_params)
    redirect_to article_path(article)
  end

  def edit #article/id/edit
    # @article
  end

  def update #article/id
    # @article
    article = @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy #article/id
    # @article
    @article.destroy
    redirect_to articles_path
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
