class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :organizer_id
      t.string :location
      t.string :contact_email
      t.string :phone_number
      t.boolean :is_free
      t.datetime :start_date
      t.datetime :end_date
      t.text :description
      t.timestamps
    end
  end
end
