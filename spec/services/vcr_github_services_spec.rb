require 'rails_helper'

describe GitHubService do
  describe "users" do
    before(:each) do
      @user = User.create(uid:1, username: "thedanielvogelsang", token: "75e2f9ad47f87fbde8d0aa667768147107148066")
    end
    it "finds all users" do
      VCR.use_cassette("services/find_users") do
        users = GitHubService.find_all_users(@user)
        expect(users.first[:login]).to eq('mojombo')
        expect(users.count).to eq(30)
      end
    end
  end
end
