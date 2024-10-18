class AddKindToReactions < ActiveRecord::Migration[7.2]
  def change
    add_column :reactions, :kind, :string
  end
end
