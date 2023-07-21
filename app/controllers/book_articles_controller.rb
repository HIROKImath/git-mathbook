class BookArticlesController < ApplicationController
  def new
    @bar = BookArticle.new
    @user = current_user
    @user_books = @user.books.all
  end

  def create
    @bar = BookArticle.new(bar_params)
    @bar.user_id = current_user.id

    if @bar.save
      flash[:notice] = "You have created book articles successfully."
      redirect_to book_book_article_path(@bar.book_id, @bar.id)
    else
      render :new
    end
  end

  def index
  end

  def show
    @bar = BookArticle.find(params[:id])
    @user = @bar.user
  end

  def destroy
  end


  private
  # ストロングパラメータ
    def bar_params
      params.require(:book_article).permit(:title, :body, :page, :chapter, :section, :book_id, :article_image, :created_at, :updated_at)
    end

# https://qiita.com/nao0725/items/47606b8975603a12fd5e
    def correct_user
      @bar = Book.find(params[:id])
      @user = @bar.user
      redirect_to book_book_articles_path unless @user == current_user
    end
end
