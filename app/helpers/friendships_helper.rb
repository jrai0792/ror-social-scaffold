module FriendshipsHelper
  def friend_list?(arg)
   return "Friends" if arg=="following"
  end
end
