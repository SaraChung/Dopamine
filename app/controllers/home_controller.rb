class HomeController < ApplicationController
	layout 'devise'
	require 'firebase'

	def index
		if user_signed_in?
			redirect_to blog_path(current_user.blog)
		end
	end
end
