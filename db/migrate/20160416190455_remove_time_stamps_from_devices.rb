class RemoveTimeStampsFromDevices < ActiveRecord::Migration
  def change
	remove_column :devices, :timestamps
  end
end
