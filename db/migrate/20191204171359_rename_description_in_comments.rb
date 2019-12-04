class RenameDescriptionInComments < ActiveRecord::Migration[6.0]
  def change
    rename_column :comments,:description,:content
  end
end
