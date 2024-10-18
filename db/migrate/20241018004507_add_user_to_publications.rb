class AddUserToPublications < ActiveRecord::Migration[7.2]
  def change
    add_reference :publications, :user, foreign_key: true, null: true
  end
end
