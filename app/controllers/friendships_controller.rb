class FriendshipsController < ApplicationController
  def create
    status = false
    @friendship = Friendship.new
    @friendship.invitor_id = params[:sender_id]
    @friendship.invitee_id = current_user.id
    status = true if params[:commit] == 'Accept'
    @friendship.status = status
    @friendship.save
    @invitation = Invitation.where('sender_id = ? and reciever_id = ?', params[:sender_id], current_user.id).first
    @invitation.update(status: false)
    redirect_to root_path
  end

  def index
    @friendships = []
    @status = ""
    if params[:commit].include?("Following")
      @friendships = Friendship.request_confirmed(params[:user_id])
      @status = 'following'
    else
      @friendships = Friendship.accepted_request(params[:user_id])
      @status = 'followers'
    end
  end
end
