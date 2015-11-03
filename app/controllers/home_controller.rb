class HomeController < ApplicationController
	def index
		@books = Book.take(10)
	end
end