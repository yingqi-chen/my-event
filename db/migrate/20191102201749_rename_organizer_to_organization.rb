class RenameOrganizerToOrganization < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :organizer_id, :organization_id
    rename_column :comments, :organizer_id, :organization_id

  end
end
