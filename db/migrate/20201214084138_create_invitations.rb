class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.boolean :status, default: true

      t.timestamps
    end

    add_reference :invitations, :sender, references: :users, index: true
    add_foreign_key :invitations, :users, column: :sender_id

    add_reference :invitations, :reciever, references: :users, index: true
    add_foreign_key :invitations, :users, column: :reciever_id
  end
end
