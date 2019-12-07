class AddEventIdToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :event_id, :integer
  end
end
