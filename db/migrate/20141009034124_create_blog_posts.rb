class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.integer :user_id
      t.integer :blog_id
      t.string :photo
      t.text :body
      
      t.timestamps
    end
  end
end
