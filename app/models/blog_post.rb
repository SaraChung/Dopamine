class BlogPost < ActiveRecord::Base
	belongs_to :user
  belongs_to :blog

  mount_uploader :photo, BlogPostPhotoUploader

  acts_as_commentable
  
end
