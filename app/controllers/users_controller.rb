class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @profile = Profile.where(:id => params[:id]).first
    @user = @profile.user
  end

  def matches
    @matches = current_user.followees(User)
    @profiles = Profile.where('user_id IN (?)', @matches.map(&:id)).includes(:user)
    #@profiles = Profile.all
  end

  def add_match
    match = User.find(params[:match_id])
    current_user.follow!(match)
    match.follow!(current_user)
    flash[:notice] = "A new match has been added to your matches."
    redirect_to matches_users_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Your account has been deleted!"
    redirect_to root_path
  end
end
