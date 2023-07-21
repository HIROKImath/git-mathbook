class BooksController < ApplicationController
  # 参照サイト：https://qiita.com/nao0725/items/47606b8975603a12fd5e
before_action :correct_user, only: [:edit]

def new
  @book = Book.new
end

def create
  book = Book.new(book_params)
  book.user_id = current_user.id

  if book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(book.id)
  else
    render :new
  end
end



def index

  @books = Book.all
  @user = current_user

end

  def show
  #New bookの入力欄を空欄にするため、createで代入されたインスタンス変数と、別のインスタンス変数を使う
    @book_new = Book.new


    @book = Book.find(params[:id])
    @user = @book.user

  end




  def edit
    @book = Book.find(params[:id])

# https://qiita.com/yuuyas222/items/722945d0855466be9c89
    # if @book.user == current_user
    #   render "edit"
    # else
    #   redirect_to user_path(@book.user_id)
    # end

  end

  def update
    @book = Book.find(params[:id])
    # @book.update(book_params)
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      # @books = Book.all
      render :edit
    end
  end

 # booksコントローラーのindexアクションへリダイレクト
  def destroy
    @book = Book.find(params[:id])  # データ（レコード）を1件取得

    if @book.destroy
      flash[:notice] ="You have destroyed book successfully."
      redirect_to books_path
    end
  end

  # usersコントローラーのshowアクションへリダイレクトする場合
  # def destroy
  #   @book = Book.find(params[:id])  # データ（レコード）を1件取得
  #   delete_user_id = @book.user_id
  #   if @book.destroy
  #     flash[:notice] ="Book was successfully destroyed."
  #     redirect_to user_path(delete_user_id)
  #   end
  # end

  private
  # ストロングパラメータ
    def book_params
      params.require(:book).permit(:title, :author, :isbn, :book_image, :body)
    end

# https://qiita.com/nao0725/items/47606b8975603a12fd5e
    def correct_user
      @book = Book.find(params[:id])
      @user = @book.user
      redirect_to books_path unless @user == current_user
    end
end
