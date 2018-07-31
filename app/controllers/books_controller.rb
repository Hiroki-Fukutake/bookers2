class BooksController < ApplicationController
  def new
  	# @book = Book.new
  	# @books = Book.all
  end
  def index
  	@user = User.find(current_user.id)
  	@book = Book.new
  	@books = Book.all
  end
  def create
  	book = Book.new(book_params)
  	book.user_id = current_user.id
  	book.save
  	redirect_to new_book_path
  end
  def show
  	@book = Book.find(params[:id])
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
