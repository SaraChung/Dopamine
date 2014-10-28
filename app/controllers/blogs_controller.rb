class BlogsController < ApplicationController
  before_action :authenticate_user!

  def show
    @blog = Blog.find(params[:id])
    @blog_posts = @blog.blog_posts.order('created_at desc')
  end
  
end
