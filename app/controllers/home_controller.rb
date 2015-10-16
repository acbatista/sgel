class HomeController < ApplicationController
	def index
		@books = Book.take(3)
	end
end