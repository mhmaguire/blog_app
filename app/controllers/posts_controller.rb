class PostsController < ApplicationController
	before_filter :authenticate_user!, except: :show
	respond_to :html
	def show
		@post = @blog.entries.find(params[:id]).decorate
		respond_with @post
	end

	def new
		@post = Post.new
	end

	def create
		@post = @blog.entries.build(params[:post])
		flash[:notice] = "Post Created!" if @post.save
		respond_with @post
	end

	def edit
		@post = @blog.entries.find(params[:id])
	end

	def update
		@post = @blog.entries.find(params[:id])
		flash[:notice]= "Post Updated!" if @post.update_attributes(params[:post])
		respond_with @post
	end

	def destroy
		@post = @blog.entries.find(params[:id])
		flash[:notice] = "Post Destroyed!" if @post.destroy
		redirect_to root_path
	end
end
