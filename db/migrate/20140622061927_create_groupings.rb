class CreateGroupings < ActiveRecord::Migration
  def change
    create_table :groupings do |t|
			t.integer "group_id"
			t.integer "friendship_id"

      t.timestamps
    end
  end
end
