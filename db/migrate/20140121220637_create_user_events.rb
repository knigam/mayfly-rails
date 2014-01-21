class CreateUserEvents < ActiveRecord::Migration
  def change
    create_table :user_events do |t|
      t.integer :id
      t.string :user_id
      t.integer :shared_id
      t.string :name
      t.string :location
      t.integer :time
      t.int :min
      t.int :max

      t.timestamps
    end
  end
end
