class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :timestamps
      t.string :name
      t.string :particle_id

      t.timestamps null: false
    end
  end
end
