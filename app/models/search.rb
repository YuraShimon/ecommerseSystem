class Search < ApplicationRecord
	def products
		@products ||= find_products
	end

	private
end
