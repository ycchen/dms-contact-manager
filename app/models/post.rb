class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :contact
  has_many :comments

  def self.search(search)
  	if search
  		# find(:all, :joins => :contact, :conditions => ['posts.title like ? or posts.body like ? or contacts.first_name like ? or contacts.last_name like ? or contacts.company like ?', "%#{search}%", "%#{search}%", "%#{search}%" , "%#{search}%", "%#{search}%"])
  		joins(:contact, :user).where(['posts.title like ? or posts.body like ? or contacts.first_name like ? or contacts.last_name like ? or contacts.company like ? or users.display_name like ?', "%#{search}%", "%#{search}%", "%#{search}%" , "%#{search}%", "%#{search}%", "%#{search}%"]).order('created_at DESC')
  	else
  		where.order('created_at DESC')
  	end
  end
end
