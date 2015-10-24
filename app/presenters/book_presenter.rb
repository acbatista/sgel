class BookPresenter
	delegate :user, :created_at, :description, :location, :title,
						:to_param, :reviews, to: :@book

	def self.model_name
		Book.model_name
	end

	def initialize(book, context, show_form=true)
		@context = context
		@book = book
		@show_form = show_form
	end

	def can_review?
		@context.user_signed_in?
	end

	def show_form?
		@show_form
	end

	def review
		@review ||= @book.reviews.
			find_or_initialize_by(user_id: @context.current_user.id)
	end

	def review_route
		[@book, review]
	end

	def route
		@book
	end

	def review_points
		Review::POINTS
	end

	def stars
		@book.reviews.stars
	end

	def total_reviews
		@book.reviews.size
	end

	def to_partial_path
		'book'
	end
	 def picture_url
    @book.picture_url
  end

  def thumb_url
    @book.picture.thumb.url
  end

  def has_picture?
    @book.picture?
  end
end