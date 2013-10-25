class CommentsController < ApplicationController
	respond_to :html, :js
	before_filter :authorize_post

	def create
		@comment = @post.add_comment(params[:comment]).decorate
		flash[:notice]="Comment Created!" if @comment.save
		respond_with @post
	end

	private 
	def authorize_post
		@post = @blog.entries.find(params[:post_id])
		authorize! :comment, @post
	end
end
