class UsersController < ApplicationController
  # 参照サイト：https://qiita.com/nao0725/items/47606b8975603a12fd5e
before_action :correct_user, only: [:edit]


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def userbooks
    @user = User.find(params[:id])
    @user_books = @user.books.all
  end

  def edit
    @user = User.find(params[:id])
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
