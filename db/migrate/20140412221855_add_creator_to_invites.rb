class AddCreatorToInvites < ActiveRecord::Migration
  def change
		add_column :invites, :creator, :boolean, :null => false, :default => false
  end
end
