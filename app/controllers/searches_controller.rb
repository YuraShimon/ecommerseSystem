class SearchesController < ApplicationController
	def new
		@search = Search.new
	end

	def create
		@search = Search.new(params[:product])
		redirect_to @search
	end

	def show
		@search = Search.find(params[:id])
	end
end
