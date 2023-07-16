class UsersController < ApplicationController
  # 参照サイト：https://qiita.com/nao0725/items/47606b8975603a12fd5e
before_action :correct_user, only: [:edit]


  def index
    @users = User.all

    @user = current_user
    @book = Book.new
  end

  def show
    #ref:Lesson4,Chapter 4 投稿機能を作ろう
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @book = Book.new

    @user = User.find(params[:id])
    @user_books = @user.books.all
  end

  def edit
    @user = User.find(params[:id])

    # if @user == current_user
    #   render "edit"
    # else
    #   redirect_to user_path(current_user)
    # end

  end

  def update
    @user = User.find(params[:id])

    # 現場ではこういう書き方はあまりしない
    true_or_false = @user.update(user_params)
    # if @user.update(user_params)
    if true_or_false
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,  :introduction, :profile_image)
  end

# https://qiita.com/nao0725/items/47606b8975603a12fd5e
  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless @user == current_user
  end
end
