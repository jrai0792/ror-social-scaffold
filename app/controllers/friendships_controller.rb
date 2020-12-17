class FriendshipsController < ApplicationController
  def create
    status = false
    @friendship = Friendship.new
    @friendship.invitor_id = params[:sender_id]
    @friendship.invitee_id = current_user.id
    status = true if params[:commit] == 'Accept'
    @friendship.status = status
    @friendship.save
    @friendship1 = Friendship.new
    @friendship1.invitee_id = params[:sender_id]
    @friendship1.invitor_id = current_user.id
    status = true if params[:commit] == 'Accept'
    @friendship1.status = status
    @friendship1.save
    @invitation = Invitation.where('sender_id = ? and reciever_id = ?', params[:sender_id], current_user.id).first
    @invitation.update(status: false)
    redirect_to root_path
  end

  def index
    @friendships = []
    @status = ''
    if params[:commit].include?('Friend')
      @friendships = Friendship.request_confirmed(params[:user_id])
      @status = 'following'
    else
      @friendships = Friendship.accepted_request(params[:user_id])
      @status = 'followers'
    end
  end
end
