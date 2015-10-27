class User < ActiveRecord::Base
  acts_as_tree # parent_id is required

  #"user"=>{"account"=>"xiaosou4", "name"=>"xiaosou4", "cellphone"=>"", "email"=>"xiaosou4@example", "password"=>"666666", "password_confirmation"=>"666666", "team_id"=>"", "notes"=>""}

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :lockable #, :validatable

  # Setup accessible (or protected) attributes for your model
  #attr_accessible :email, :password, :password_confirmation, :remember_me, :roles, :avatar
  has_and_belongs_to_many :roles
  belongs_to :team, :inverse_of => :players
  has_many :credits

  validates_presence_of(:name)
  validates_presence_of(:account)
  # Add Paperclip support for avatars
  #has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  before_validation  :set_email  # it is unique indexed now, set it if it is empty.

  def attr_accessible_role
    :custom_role
  end

  #attr_accessor :delete_avatar
  #before_validation { self.avatar = nil if self.delete_avatar == '1' }


  def has_role?(role_in_question)
    roles.where(name: role_in_question.to_s).any?
  end

  def account_info
    "#{cellphone}(#{name})"
  end

  def role_info
    roles.map(&:name).join
  end

  private
  def set_email
    self.email = "#{Time.now.to_i}-#{object_id}@example.com" if email.blank?
  end
end
