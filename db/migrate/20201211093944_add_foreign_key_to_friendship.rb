class AddForeignKeyToFriendship < ActiveRecord::Migration[6.0]
  def change
    add_reference :friendships, :invitor, references: :users, index: true
    add_foreign_key :friendships, :users, column: :invitor_id

    add_reference :friendships, :invitee, references: :users, index: true
    add_foreign_key :friendships, :users, column: :invitee_id
  end
end
