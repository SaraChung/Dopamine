class BlogPostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @blog_post = BlogPost.new(post_params)
    if @blog_post.save
      redirect_to blog_path(current_user.blog)
    else
      redirect_to root_path
    end
  end

  def destroy
    @blog_post = BlogPost.find(params[:id])
    @blog_post.destroy
    redirect_to blog_path(current_user.blog)
  end

  private

  def post_params
    params.require(:blog_post).permit(:user_id, :blog_id, :photo, :body)
  end
  
end
