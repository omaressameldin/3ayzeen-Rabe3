class Group < ActiveRecord::Base

  validates :user_id, presence:true
  validates :activity_id, presence:true
  validates :privacy, presence:true
  validates :max_members, presence:true
  validates :start_time, presence:true
  validates :end_time, presence:true
  validates :x_loc, presence:true
  validates :y_loc, presence:true

  belongs_to :user
  belongs_to :activity
end
