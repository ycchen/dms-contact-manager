class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :contact
  has_many :comments

  def self.search(search)
  	if search
  		# find(:all, :joins => :contact, :conditions => ['posts.title LIKE ? or posts.body LIKE ? or contacts.first_name LIKE ? or contacts.last_name LIKE ? or contacts.company LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%" , "%#{search}%", "%#{search}%"])
  		joins(:contact, :user).where(['posts.title LIKE ? or posts.body LIKE ? or contacts.first_name LIKE ? or contacts.last_name LIKE ? or contacts.company LIKE ? or users.display_name LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%" , "%#{search}%", "%#{search}%", "%#{search}%"]).order('created_at DESC')
  	else
  		where.order('created_at DESC')
  	end
  end
end
