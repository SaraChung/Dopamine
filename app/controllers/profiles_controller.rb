class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = Profile.find(params[:id])
    @user = @profile.user
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(profile_params)
      redirect_to profile_user_path(current_user.profile)
    else
      render :edit
    end
  end

  def search_profiles
    @profile = current_user.profile
    @profiles_near = Profile.near([@profile.latitude, @profile.longitude], @profile.search_distance, :units => :km)
    @profiles_age = Profile.where('age < ?', @profile.search_age)
    @profiles = @profiles_near | @profiles_age
    @profiles.delete(current_user.profile)
  end

  private

  def profile_params
    params.require(:profile).permit!
  end
  
end
