class CategoriesController < ApplicationController
	def show
		@category = Category.find_by(name: params[:id])
	end
end
