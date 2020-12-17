class Invitation < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :reciever, class_name: 'User'

  def self.invitation_exists?(sender_id, reciever_id)
    Invitation.where('(sender_id=? and reciever_id=?) or (reciever_id=? and sender_id=?)', sender_id, reciever_id,
                     reciever_id, sender_id).first
  end
end
