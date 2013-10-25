class Comment < ActiveRecord::Base
  default_scope order('created_at DESC')
  attr_accessible :author, :body
  belongs_to :post
  validate :author, :body, presence: true
end
