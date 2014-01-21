class CreateUserEvents < ActiveRecord::Migration
  def change
    create_table :user_events do |t|
      t.references :user, index: true
      t.integer :shared_id
      t.string :name
      t.string :location
      t.time :time
      t.integer :min
      t.integer :max

      t.timestamps
    end
  end
end
