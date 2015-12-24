class Credit < ActiveRecord::Base
  StatusEnum = Struct.new(:unconfirmed, :confirmed )[0, 1]

  belongs_to :user
  belongs_to :creator, class_name: "User", foreign_key: 'creator_id'
  validates_presence_of(:user)

  #https://github.com/sferik/rails_admin/wiki/Enumeration
  def status_enum
    # Do not select any value, or add any blank field. RailsAdmin will do it for you.
    # alternatively
    { self.class.human_attribute_name(:status_unconfirmed) => 0,
      self.class.human_attribute_name(:status_confirmed) => 1 }
    # [ %w(Green 0), %w(White 1)]
  end

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
