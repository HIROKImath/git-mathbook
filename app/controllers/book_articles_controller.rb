class BookArticlesController < ApplicationController

  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @bar = BookArticle.new
    @user = current_user
    @user_books = @user.books.all
    @book = Book.find(params[:book_id])
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
    # パラメータからbook_idを取得します（例: /bars?book_id=1 の場合）
    nowbook_id = params[:book_id]

    # パラメータから取得したbook_idに合致するBookArticleを全て取得して、@barに格納します
    @bars = BookArticle.where(book_id:nowbook_id)
  end

  def indexall
    @bars = BookArticle.all
  end


  def show
    @bar = BookArticle.find(params[:id])
    @user = @bar.user
  end

  def edit
    @bar = BookArticle.find(params[:id])
    @user = current_user
    @user_books = @user.books.all
    @book = Book.find(params[:book_id])
  end

  def update
    @bar = BookArticle.find(params[:id])

    if @bar.update(bar_params)
      flash[:notice] = "You have updated article successfully."
      redirect_to book_book_article_path(@bar.book_id, @bar.id)
    else
      render :edit
    end
  end


  def destroy
    bar = BookArticle.find(params[:id])

    if bar.destroy
      flash[:notice] ="You have destroyed article successfully."
      redirect_to show_userbooks_path(current_user.id)
    end
  end


  private
  # ストロングパラメータ
    def bar_params
      params.require(:book_article).permit(:title, :body, :page, :chapter, :section, :book_id, :user_id, :article_image, :created_at, :updated_at)
    end

# https://qiita.com/nao0725/items/47606b8975603a12fd5e
    def correct_user
      @bar = BookArticle.find(params[:id])
      @user = @bar.user
      redirect_to book_book_articles_path unless @user == current_user
    end
end
