class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :organizer_id
      t.integer :volunteer_id
      t.integer :event_id
      t.string :description
      t.timestamps
    end
  end
end
