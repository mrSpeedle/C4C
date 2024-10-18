class AddPublicationIdToReactions < ActiveRecord::Migration[7.2]
  def change
    add_column :reactions, :publication_id, :integer
    add_index :reactions, :publication_id
  end
end
