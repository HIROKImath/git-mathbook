class BooksController < ApplicationController
  # 参照サイト：https://qiita.com/nao0725/items/47606b8975603a12fd5e
before_action :correct_user, only: [:edit]

  def index
    #ref:Lesson4,Chapter 4 投稿機能を作ろう
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @book = Book.new


     #一覧表示機能。ここで設定するからbook用のindexアクションはいらない。
    @books = Book.all
    @user = current_user

  end

  def show
  #New bookの入力欄を空欄にするため、createで代入されたインスタンス変数と、別のインスタンス変数を使う
    @book_new = Book.new


    @book = Book.find(params[:id])
    @user = @book.user

  end

  def create
        # １. データを新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = current_user
    @books = Book.all
    # ２. データをデータベースに保存するためのsaveメソッド実行
    # @book.save
    # ３. トップ画面へリダイレクト
    # redirect_to '/books'

    # 詳細画面へリダイレクト
    # redirect_to booksid_path(book.id)

    # 詳細画面へリダイレクトしたときに、成功しましたと言うメッセージを表示させる。
    # https://pikawaka.com/rails/flash
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      render :index
      # render template: "users/show"

    end


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
      params.require(:book).permit(:title,:body_question, :body_answer, :user_id, :author, :page, :chapter,:section,:isbn)
    end

# https://qiita.com/nao0725/items/47606b8975603a12fd5e
    def correct_user
      @book = Book.find(params[:id])
      @user = @book.user
      redirect_to books_path unless @user == current_user
    end
end
