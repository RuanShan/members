class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, class_name: 'User'
  scope :for_sale, ->{ where( category: 'sale') }
end
