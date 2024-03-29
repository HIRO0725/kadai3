class BooksController < ApplicationController
    def top
    end
    
    def new
        @book = Book.new
    end
    
    def index
        @user = current_user
        @books = Book.all
    end
    
    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
            flash[:notice] = 'You have created book successfully.'
            redirect_to book_path(@book.id)
        else
            @books = Book.all
            render :index
        end
    end
    
    def show
        @book = Book.find(params[:id])
        @user = @book.user
        @books = @user.books
    end
    
    def edit
    end
    
    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to '/books'
    end
    
    private
    def book_params
        params.require(:book).permit(:title, :body)
    end
end
