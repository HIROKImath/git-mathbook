class BookImagesController < ApplicationController
  before_action :set_book

def new
  @bookimage= BookImage.new
end

def create
  @bookimage = BookImage.new(bookimage_params)
  @bookimage.book = @book

  if @bookimage.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@bookimage.book)

  else
    render books_path
    # render template: "users/show"

  end
end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  # ストロングパラメータ
    def bookimage_params
      params.require(:book_image).permit(:book_image_main,:book_image_sub1, :book_image_sub2, :book_image_sub3)
    end

    def set_book
      @book=Book.find(params[:book_id])
    end
end
