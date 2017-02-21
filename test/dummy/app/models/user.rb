class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def name
    self.email.split('@').first
  end

  def profile_url
    "/users/#{self.id}"
  end

  def avatar_url
    "//www.gravatar.com/avatar/#{Digest::MD5.hexdigest(self.email)}"
  end

  def admin?
    self.email == 'huacnlee@gmail.com'
  end
end
