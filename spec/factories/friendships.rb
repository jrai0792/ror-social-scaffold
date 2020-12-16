FactoryBot.define do
  factory :friendship do
    status { 'Accepted' }
    # userA = User.create(name: 'userA', email: 'userA33@email.com', password: 'test@12')
    # userB = User.create(name: 'userB', email: 'userB33@email.com', password: 'test@12')

    # Friendship.create(invitor_id: userA.id, invitee_id: userB.id)
  end
end
