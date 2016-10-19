class Group < ActiveRecord::Base
  has_many :groups_users, :class_name => GroupsUsers
  has_many :users, :through => :groups_users
end
