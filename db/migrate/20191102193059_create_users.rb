class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :email
      t.text :bio
      t.boolean :is_organization
      t.timestamps
    end
  end
end
