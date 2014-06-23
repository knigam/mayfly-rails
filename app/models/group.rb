class Group < ActiveRecord::Base
	belongs_to :user
	has_many :groupings, :dependent => :destroy
	has_many :friendships, :through => :groupings
	has_many :friends, :through => :friendships
	validates_uniqueness_of :user_id, :scope => "name"
end
