class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title, :subtitle
      t.integer :singleton_guard, default: 0
      t.timestamps
    end
    add_index :blogs, :singleton_guard, unique: true
  end
end
