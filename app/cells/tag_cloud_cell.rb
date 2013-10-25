class TagCloudCell < Cell::Rails
  def display(opts)
 		@tags = opts[:tags]
    render
  end
end
