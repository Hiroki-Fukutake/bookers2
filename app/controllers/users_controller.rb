class UsersController < ApplicationController
	def top
	end
	def home
	end
	def new
		# @user = User.new
		@book = Book.new
  		@books = Book.all
	end
	def index
		@users = User.all
		@user = User.find(current_user.id)
		@book = Book.new

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
		@book = Book.find(params[:id])
		@books = current_user.books
		# @users = User.all
	end

  private
  def user_params
  	params.require(:user).permit(:name, :body, :image, :introduction)
  end
end
