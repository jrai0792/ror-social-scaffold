require 'rails_helper'

RSpec.describe Friendship, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  user1 = User.create(
    name: 'ab1',
    email: 'ab@example.com',
    password: 'test@12',
    password_confirmation: 'test@12'
  )

  user2 = User.create(
    name: 'ab2',
    email: 'ab2@example.com',
    password: 'test@12',
    password_confirmation: 'test@12'
  )

  let(:friendship) { Friendship.new(invitor_id: user1.id, invitee_id: user2.id) }

  describe 'validations' do
    it 'should have a title' do
      Friendship.create(invitor_id: user1.id, invitee_id: user2.id)
      expect(friendship).not_to be_valid
    end
  end

  describe 'Associations' do
    it { should belong_to(:invitor) }
    it { should belong_to(:invitee) }
  end
end
