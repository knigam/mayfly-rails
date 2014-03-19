class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :reg_id
      t.references :user, index: true
      t.string :type
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
