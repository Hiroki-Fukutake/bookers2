class UsersController < ApplicationController
	def new
		@book = Book.new
  		@books = Book.all
	end
	def index
		@users = User.all
		@user = User.find(current_user.id)
		@book = Book.new
	end
	def create
	  	book = Book.new(book_params)
	  	book.user_id = current_user.id
	  	book.save
	  	redirect_to book_path
    end
	def edit
		@user = current_user
	end
	def update
		@user = User.find(current_user.id)
		@user.update(user_params)
		redirect_to user_path(current_user.id)
	end
	def show
		@book = Book.new
		@user = User.find(params[:id])
		@books = @user.books
	end

  private
  def user_params
  		params.require(:user).permit(:name, :body, :image, :introduction)
  end
end
