class User < ActiveRecord::Base
  acts_as_tree # parent_id is required

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :lockable

  # Setup accessible (or protected) attributes for your model
  #attr_accessible :email, :password, :password_confirmation, :remember_me, :roles, :avatar
  has_and_belongs_to_many :roles
  belongs_to :team, :inverse_of => :players
  has_many :credits

  validates_presence_of(:name)
  #validates_presence_of(:account)
  # Add Paperclip support for avatars
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  def attr_accessible_role
    :custom_role
  end

  attr_accessor :delete_avatar
  before_validation { self.avatar = nil if self.delete_avatar == '1' }


  def has_role?(role_in_question)
    roles.where(name: role_in_question.to_s).any?
  end

  def account_info
    "#{cellphone}(#{name})"
  end

  def role_info
    roles.map(&:name).join
  end
end
