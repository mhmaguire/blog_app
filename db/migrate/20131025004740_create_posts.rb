class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, :slug
      t.text :body
      t.boolean :comments_enabled, default: true
      t.references :blog
      t.timestamps
    end
    add_index :posts, :blog_id 
    add_index :posts, :slug, unique: true
  end
end
