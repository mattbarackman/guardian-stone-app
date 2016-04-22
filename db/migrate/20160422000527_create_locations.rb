class CreateLocations < ActiveRecord::Migration
	def change
		create_table :locations do |t|
			t.references :device
			t.float :latitude
			t.float :longitude
			t.string :address
			t.timestamps
		end
	end
end
