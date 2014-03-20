class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, :null => false
      t.string :description
      t.time :time, :null => false
      t.string :location, :null => false
      t.integer :min
      t.integer :max
      t.timestamps
    end

    create_table :events_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :event

      t.timestamps
    end
  end
end
