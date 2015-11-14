class UserPrivacy < ActiveRecord::Base
  validates_uniqueness_of :user_id, scope: :activity_id

belongs_to :user
belongs_to :activity

end
