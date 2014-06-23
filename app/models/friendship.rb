class Friendship < ActiveRecord::Base
	belongs_to :user
	belongs_to :friend, :class_name => 'User'
	has_many :groupings, :dependent => :destroy
	has_many :groups, :through => :groupings
	validates_uniqueness_of :user_id, :scope => "friend_id"
end
