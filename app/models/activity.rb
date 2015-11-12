class Activity < ActiveRecord::Base
  validates :name, presence:true

  has_many: groups
end
