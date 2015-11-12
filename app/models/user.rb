class User < ActiveRecord::Base
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :email, presence:true
  validates :password, presence:true
  validates :gender, presence:true
  validates :phone_number, presence:true

  has_many :posts ,  dependent: :update
  has_many :comments,dependent: :update
  has_many :groups, :through => :group_members , dependent: :update
  has_many :group_members, dependent: :update
end
