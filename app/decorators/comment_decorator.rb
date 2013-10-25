class CommentDecorator < Draper::Decorator
  delegate_all

  def body
  	extensions = {fenced_code_blocks: true, autolink: true}
  	h.markdown(object.body, extensions)
  end
end
