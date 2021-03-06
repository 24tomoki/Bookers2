class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = current_user
    @book_comment = BookComment.new
    @book_comments = @book.book_comments
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: 'successfully'
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
    if current_user.id != @book.user.id
     redirect_to books_path, notice: 'successfully'
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book), notice: 'successfully'
    else
      render 'edit'
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
