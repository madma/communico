class ArticlesController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(self.article_params)

    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def index
    @articles = Article.all
  end

  def show
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(self.article_params)
      redirect_to articles_path
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])

    @article.destroy
    flash[:notice] = "'#{@article.title}' removed!"
    redirect_to articles_path
  end

  #  HELPER METHODS
  def article_params
    params.require(:article).permit(:title, :author, :publisher, :link, :text, :published_on, :thumbnail_img, :section)
  end

end
