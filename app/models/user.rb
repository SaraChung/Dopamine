class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  
  has_one :profile, :dependent => :destroy
  has_one :blog, :dependent => :destroy
  has_many :blog_posts, :dependent => :destroy

  validates :first_name, :last_name, presence: true
  acts_as_followable
  acts_as_follower

  acts_as_messageable :required => [:body], :class_name => "Message"

  after_create :create_profile_and_blog

  def self.find_for_facebook_oauth(auth)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        if auth.info.email
          new_user = User.new(
            provider:auth.provider,
            uid:auth.uid,
            email:auth.info.email,
            password:Devise.friendly_token[0,20]
            )
    #   new_user.skip_confirmation!
    new_user.save
    return new_user
      end
    end
  end
end  

private

def create_profile_and_blog
  Blog.create(:user_id => self.id)
  Profile.create(:user_id => self.id)
end

end
