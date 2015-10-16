class Book < ActiveRecord::Base
	def complete_name
		"#{title}, #{location}"
	end
end
