class AddStatusFromFriendship < ActiveRecord::Migration[6.0]
  def change
    add_column :friendships, :status, :boolean
  end
end
