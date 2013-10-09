class VideosController < ApplicationController
	def new
		@video = Video.new
	end

	def index
		@videos = Video.all
		@categories = Category.all
	end

	def show
		@video = Video.find(params[:id])
	end
end