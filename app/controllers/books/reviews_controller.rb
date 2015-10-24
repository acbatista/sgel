class Book::ReviewsController < ApplicationController
	before_filter :require_authentication

	def create
		review = book.reviews.find_or_initialize_by(user_id: current_user.id)
		review.update!(review_params)
		head :ok
	end

	def update
		create
	end

	private

	def book
		@book || Book.find(params[:book_id])
	end
	def review_params
		params.
			require(:review).permit(:points)
	end
end