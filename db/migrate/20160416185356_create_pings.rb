class CreatePings < ActiveRecord::Migration
  def change
    create_table :pings do |t|
      t.references :device
      t.timestamps null: false
    end
  end
end
