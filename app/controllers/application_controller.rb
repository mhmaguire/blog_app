class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_blog

  private 
  def load_blog
  	@blog = Blog.instance
  end

  def markdown(body, extensions = {})
  	renderer = RenderVideoLinks.new
  	md = Redcarpet::Markdown.new(renderer, extensions)
  	md.render(body).html_safe
  end
  helper_method :markdown
end
