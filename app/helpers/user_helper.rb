module UserHelper

  def check_user(user1, user2)
    unless 
      user1 == user2
    end
  end

  def check_friendship(arg1,arg2)
    unless Friendship.friendship_exists?(arg1.id, arg2.id)
      unless Invitation.invitation_exists?(arg1.id, arg2.id) || Invitation.invitation_exists?(arg2.id, arg1.id)
        form_for(arg2, url: user_invitations_path(arg2), method: 'POST') do |f|
          f.submit "Send Invite"
        end
      end
    end
  end
end