class Blog < ActiveRecord::Base
  attr_accessible :subtitle, :title
  validates_inclusion_of :singleton_guard, in: [0]
  validates :title, :subtitle, presence: true
  has_many :posts

  def add_entry

  end

  def entries
  	posts
  end

  def tags 
    Post.tag_counts_on(:tags)
  end

  def self.instance
  	first || Blog.create(title: "Default Blog Title", subtitle: "Subtitle of a default blog")
  end
end
