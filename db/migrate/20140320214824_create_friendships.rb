class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :user_id
      t.integer :friend_id
			t.string :friend_name, :null => false

      t.timestamps
    end
  end
end
