class AddMasterToInvites < ActiveRecord::Migration
  def change
		add_column :invites, :master, :boolean, :null => false, :default => false
  end
end
