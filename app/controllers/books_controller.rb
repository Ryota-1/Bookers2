class BooksController < ApplicationController
     before_action :authenticate_user!

    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
            flash[:success] = "You have creatad book successfully."
            redirect_to book_path(@book.id)
        else
            @books = Book.all
            @user = current_user
            render :action => "index"
        end
    end

    def index
        @books = Book.all
        @book = Book.new
        @user = current_user
        @users = User.all
    end

    def show
        @book = Book.new
        @bookdetail = Book.find(params[:id])
    end

    def edit
        @book = Book.find(params[:id])
        if @book.user_id != current_user.id
            redirect_to books_path
        end
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            flash[:success] = "You have updated user successfully."
            redirect_to book_path
        else
            render :action => "edit"
        end
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        flash[:success] = "You have delete user successfully."
        redirect_to books_path
    end

    private

    def book_params
        params.require(:book).permit(:title, :body)
    end
end