class Friendship < ApplicationRecord
  belongs_to :invitor, class_name: 'User'
  belongs_to :invitee, class_name: 'User'

  def self.accepted_request(invitee_id)
    Friendship.where('status=? and invitee_id=?', true, invitee_id)
  end

  def self.request_confirmed(invitor_id)
    Friendship.where('status=? and invitor_id=?', true, invitor_id)
  end

  def self.mutual_friends(user1, user2)
    friend1 = Friendship.where('invitor_id=?', user1.id).pluck(:invitee_id)
    friend2 = Friendship.where('invitor_id=?', user2.id).pluck(:invitee_id)
    common_friend = friend1.select { |friend| friend2.include?(friend) }
    arr = []
    i = 0
    while i < common_friend.length
      arr.push(User.find(common_friend[i]))
      i += 1
    end
    arr
  end

  def self.friendship_exists?(invitor_id, invitee_id)
    Friendship.where('(invitor_id=? and invitee_id=?) or (invitee_id=? and invitor_id=?)', invitor_id, invitee_id,
                     invitee_id, invitor_id).first
  end
end
