class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
        t.string :street_address_1
        t.string :street_address_2
        t.string :city
        t.string :state
        t.string :zipcode
        t.string :address_type
      t.timestamps
    end
  end
end
