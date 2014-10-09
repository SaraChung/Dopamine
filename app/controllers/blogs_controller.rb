class BlogsController < ApplicationController
  before_action :authenticate_user!

  def show
    @blog = Blog.find(params[:id])
    @blog_posts = BlogPost.where(:blog_id => @blog.id).order('created_at desc')
  end
  
end
