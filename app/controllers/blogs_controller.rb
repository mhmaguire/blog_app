class BlogsController < ApplicationController
  respond_to :html
  before_filter :authenticate_user!, except: :index
  def index
  	@entries = with_tags.page(params[:page])
  end

  def edit
  	#@blog	
  end

  def update
  	if @blog.update_attributes(params[:blog])
  		respond_with @blog, location: root_path, notice: "Blog Settings Updated!"
  	else
  		render :edit
  	end
  end

  private
  def with_tags
    return @blog.entries.tagged_with(params[:tag]) if params[:tag].present?
    @blog.entries
  end
end
