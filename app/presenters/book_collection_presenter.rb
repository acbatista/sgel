class BookCollectionPresenter
	delegate :current_page, :num_pages, :limit_value, :total_pages,
    to: :@books

  def initialize(books, context)
    @books = books
    @context = context
  end

  def to_ary
    @books.map do |book|
      BookPresenter.new(book, @context, false)
    end
  end
end