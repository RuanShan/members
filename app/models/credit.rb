class Credit < ActiveRecord::Base

  belongs_to :user
  belongs_to :creator, class_name: "User", foreign_key: 'creator_id'
  validates_presence_of(:user)
end
