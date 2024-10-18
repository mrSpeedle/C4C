class AddUserIdToReactions < ActiveRecord::Migration[7.2]
  def change
    add_column :reactions, :user_id, :integer
    add_index :reactions, :user_id
  end
end
