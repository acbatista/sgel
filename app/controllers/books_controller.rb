class BooksController < ApplicationController
  before_action :set_book, only: [:show]
  before_action :set_users_book, only: [:edit, :update, :destroy]
  before_action :require_authentication, only: [:new, :edit, :create, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = current_user.books.build
  end

  # GET /books/1/edit
  def edit
  end

  def create
    @book = current_user.books.build(book_params)
      if @book.save
        redirect_to @book, notice: t('flash.notice.book_create')
      else
        render :new
      end
  end

  def update
      if @book.update(book_params)
        redirect_to @book, notice: t('flash.notice.book_update')
      else
        render :edit
      end
  end

  def destroy
    @book.destroy
    redirect_to books_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    def set_users_book
      @book = current_user.books.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :location, :description)
    end
end
