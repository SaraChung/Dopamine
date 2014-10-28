class Blog < ActiveRecord::Base
	
	has_many :blog_posts
  belongs_to :user
  
end
