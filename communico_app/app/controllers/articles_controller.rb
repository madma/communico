class ArticlesController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new
    # TODO: get the validated link from the user article#new form
    new_form_link = self.article_params[:link]
    mechanize = Mechanize.new
    doc = mechanize.get(new_form_link)
    link        = doc.at("[property='og:url']")["content"]
    type        = doc.at("[property='og:type']")["content"]
    title       = doc.at("[property='og:title']")["content"]
    description = doc.at("[property='og:description']")["content"]
    image       = doc.at("[property='og:image']")["content"]
    section     = doc.at("[property='article:section']")["content"]

    binding.pry
    # TODO: get the page at the link url
    # TODO: parse the page at the url for article attributes
    # TODO: set the article attributes
    # TODO: continue to save below

    # TODO: parse for subjects within the articles
    # TODO: relate the parsed subjects to the article
    # TODO: save the parsed subjects to the Subjects table in the db

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
