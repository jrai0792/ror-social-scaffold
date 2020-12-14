class FriendshipsController < ApplicationController
  def create

    @friendship = Friendship.new
    @friendship.invitor_id = params[:sender_id]
    @friendship.invitee_id = current_user
    @friendship.save!
    @invitation = Invitation.where("sender_id = ? and reciever_id = ?", params[:sender_id], current_user.id)
    @invitation.update(status: false)
    redirect_to root_path
  end
end
