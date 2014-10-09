class Blog < ActiveRecord::Base
	has_one :blog_post
  belongs_to :user
  
end
