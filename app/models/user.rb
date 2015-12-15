class User < ActiveRecord::Base
  # validates :first_name, presence:true
  # validates :last_name, presence:true
  # validates :email, presence:true, uniqueness: { case_sensitive: false }
  # validates :password, presence:true, length: { minimum: 100 }
  # validates :gender, presence:true
  # validates :phone_number, presence:true

  has_many :posts ,  dependent: :destroy
  has_many :comments,dependent: :destroy
  has_many :groups, :through => :group_members , dependent: :destroy
  has_many :groupMembers, dependent: :destroy
  has_many :UserPrivacies, dependent: :destroy
  has_many :friendships
  has_many :friends, :through => :friendships

end
