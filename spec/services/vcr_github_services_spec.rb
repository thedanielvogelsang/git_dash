require 'rails_helper'

describe GitHubService do
  describe "users" do
    before(:each) do
      @user = User.create(uid:1, username: "thedanielvogelsang", token: 123)
    end
  end
end
