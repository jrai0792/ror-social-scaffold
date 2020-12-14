require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  describe "validations" do
    let(:user) {FactoryBot.build(:user)}
    it "should have a title" do
      user.name = nil
      expect(user).to_not be_valid
    end
  end
end
