module BooksHelper
  def belongs_to_user(book)
    user_signed_in? && book.user == current_user
  end

  def belongs_to_users(book)
    user_signed_in?
  end
end
