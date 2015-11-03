class BooksController < ApplicationController
  PER_PAGE = 10

  before_action :set_book, only: [:show]
  before_action :set_users_book, only: [:edit, :update, :destroy]
  before_action :require_authentication,
    only: [:new, :edit, :create, :update, :destroy]

  def index
    @search_query = params[:q]
    books = Book.search(@search_query).
      most_recent.
      page(params[:page]).
      per(PER_PAGE)
    @books = BookCollectionPresenter.new(books, self)
  end

  def show
    if user_signed_in?
      @user_review = @book.reviews.
        find_or_initialize_by(user_id: current_user.id)
    end
  end

  def new
    @book = current_user.books.build
  end

  def edit
  end

  def create
    @book = current_user.books.build(book_params)

    if @book.save
      redirect_to @book, notice: t('flash.notice.book_created')
    else
      render :new
    end
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: t('flash.notice.book_updated')
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_url
  end

  private
  def set_book
    book_model = Book.friendly.find(params[:id])
    @book = BookPresenter.new(book_model, self)
  end

  def set_users_book
    @book = current_user.books.friendly.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :description, :picture)
  end
end