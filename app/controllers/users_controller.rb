class UsersController < ApplicationController
    
    def show
        @user = User.find(params[:id])
        @books = @user.books 
        @book = Book.new
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def index
        @book = Book.new
        @user = current_user
        @users = User.all
    end
    
    
    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to current_user
    end


    private

    def user_params
        params.require(:user).permit(:name, :profile_image, :introduction)
    end
end
