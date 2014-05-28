class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, :null => false
      t.string :description
      t.datetime :start_time, :null => false
			t.datetime :end_time, :null => false
      t.string :location, :null => false
      t.integer :min
      t.integer :max
      t.timestamps
    end
  end
end
