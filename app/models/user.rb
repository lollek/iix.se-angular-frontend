class User < ActiveRecord::Base
  has_secure_password
  has_many :groups_users, :class_name => GroupsUsers
  has_many :groups, :through => :groups_users
end
