FactoryBot.define do
  factory :friendship do
    status { 'Accepted' }
    @userA = User.create(name: 'userA', email: 'userA@email.com', password: 'test@12')
    @userB = User.create(name: 'userB', email: 'userB@email.com', password: 'test@12')
    @iv1 = Friendship.create(invitee_id: @userB.id, invitor_id: @userA.id)
  
  end
end
