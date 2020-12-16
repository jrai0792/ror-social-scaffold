require 'rails_helper'

RSpec.describe Post, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'validations' do
    let(:post) {FactoryBot.build(:post)}
    it 'should have a title' do
      post.content = nil
      expect(post).to_not be_valid
    end
  end

  describe 'Associations' do
    it {should belong_to(:user)}
  end
end
