class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
				 :confirmable
  has_many :devices, :dependent => :destroy
	
	has_many :invites, :dependent => :destroy
	has_many :events, :through => :invites

	has_many :friendships, :dependent => :destroy
	has_many :friends, :through => :friendships
end
