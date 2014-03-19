class Device < ActiveRecord::Base
  belongs_to :user
  self.inheritance_column = nil
  validates_uniqueness_of :reg_id
end
