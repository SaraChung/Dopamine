class Profile < ActiveRecord::Base
	belongs_to :user
	# serialize :interests

# geocoded_by :address
# after_validation :geocode

  reverse_geocoded_by :latitude, :longitude
# after_validation :reverse_geocode

  mount_uploader :profile_picture, ProfilePictureUploader
  
end
