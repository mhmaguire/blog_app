class Post < ActiveRecord::Base
  default_scope order("created_at DESC").includes(:comments, :tags)
  attr_accessible :body, :title, :comments_enabled, :tag_list
  belongs_to :blog
  validates :body, :title, presence: true
  has_many :comments, dependent: :destroy

  acts_as_taggable

  extend FriendlyId
  friendly_id :title, use: [:slugged]

  def comments_enabled?
  	!!comments_enabled
  end

  def add_comment(comment)
  	comment = comments.build(comment)
  end

  def next
    blog.entries.where("id > ?", id).order("id ASC").first.try(:id)
  end

  def prev
    blog.entries.where("id < ?", id).order("id DESC").first.try(:id)
  end
end
