class Following < ActiveRecord::Base
  attr_accessible :follower_id, :user_id

  belongs_to :user
  belongs_to :follower, :class_name => "User"
end
