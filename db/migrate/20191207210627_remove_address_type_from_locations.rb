class RemoveAddressTypeFromLocations < ActiveRecord::Migration[6.0]
  def change
    remove_column :locations, :address_type
  end
end
