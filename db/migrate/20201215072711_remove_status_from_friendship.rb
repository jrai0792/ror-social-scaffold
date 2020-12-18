class RemoveStatusFromFriendship < ActiveRecord::Migration[6.0]
  def change
    remove_column :friendships, :status, :string
  end
end
