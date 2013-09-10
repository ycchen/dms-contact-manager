class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :contact
  has_many :comments
end
