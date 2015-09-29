class Credit < ActiveRecord::Base

  belongs_to :user
  belongs_to :creator, class_name: "User", foreign_key: 'creator_id'
  validates_presence_of(:user)


  def deal_type_info
    deal_type == 0 ? '充值' : '充值'
  end

  def deal_action_info
    deal_type == 0 ? '转入' : '转入'
  end

  def creator_info
    creator.account
  end

  def user_info
    user.account
  end
end
