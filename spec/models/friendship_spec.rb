require 'rails_helper'

RSpec.describe Friendship, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'validations' do
    let(:friendship) { FactoryBot.build(:friendship) }
    it 'should have a title' do
      friendship.status = 'not accepted'
      expect(friendship).to_not be_valid
    end
  end

  describe 'Associations' do
    it { should belong_to(:invitor) }
    it { should belong_to(:invitee) }
  end
end
