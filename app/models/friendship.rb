class Friendship < ApplicationRecord
  belongs_to :invitor, class_name: 'User'
  belongs_to :invitee, class_name: 'User'

  def self.accepted_request(invitee_id)
    Friendship.where('status=? and invitee_id=?', true, invitee_id)
  end

  def self.request_confirmed(invitor_id)
    Friendship.where('status=? and invitor_id=?', true, invitor_id)
  end
end
