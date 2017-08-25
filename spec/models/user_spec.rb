require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "is invalid without a uid" do
      user = User.new(username: "DVOG", token:"5444kadib95n509x", image:"image.url")
      expect(user).to_not be_valid
    end
    it "is invalid without a username" do
      user = User.new(uid: 123, token:"5444kadib95n509x", image:"image.url")
      expect(user).to_not be_valid
    end
    it "is invalid without a token" do
      user = User.new(username: "DVOG", uid:123, image:"image.url")
      expect(user).to_not be_valid
    end
    it "is valid without an image" do
      user = User.new(username: "DVOG", token:"5444kadib95n509x", uid: 12412401)
      expect(user).to be_valid
    end
  end
end
