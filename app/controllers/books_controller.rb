class BooksController < ApplicationController
    def top
    end
    
    def new
        @book = Book.new
    end
    
    def index
        @user = user
    end
    
    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
            flash[:notice] = 'You have created book successfully.'
            redirect_to current_user
        else
            @books = Book.all
            render :index
        end
    end
    
    def show
    end
    
    def edit
    end
    
    private
    def book_params
        params.require(:book).permit(:title, :body)
    end
end
