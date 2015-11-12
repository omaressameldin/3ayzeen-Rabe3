class Post < ActiveRecord::Base

  validates :user_id, presence:true
  validates :receiver_id, presence:true
  validates :content_id, presence:true

  belongs_to :user
  has_many :comments
end
