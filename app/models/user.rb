class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
  
  has_one :profile
  has_one :blog
  has_many :blog_posts
  
  acts_as_followable
  acts_as_follower

  acts_as_messageable :required => [:topic, :body], :class_name => "message"

  after_create :create_profile_and_blog

  private

  def create_profile_and_blog
    Blog.create(:user_id => self.id)
    Profile.create(:user_id => self.id)
  end

end
