class AddAccessTokenToDevices < ActiveRecord::Migration
  def change
	add_column :devices, :access_token, :string, :nullable => false
  end
end
