class Comment < ActiveRecord::Base
  validates :post_id, presence:true
  validates :user_id, presence:true
  validates :content, presence:true

  belongs_to :user
  belongs_to :post
end
