class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  # Removed :registerable 
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts       
  has_many :contacts

  def avatar
		Gravatar.new(self.email).image_url
	end

	def admin?
		has_role?(:admin)
	end

end
