class ChangeUserIdToNotNullInPublications < ActiveRecord::Migration[7.2]
  def change
    change_column_null :publications, :user_id, false
  end
end
