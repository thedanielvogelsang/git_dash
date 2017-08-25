require 'rails_helper'

RSpec.describe Follower, type: :model do
  context "validations" do
    it "can call username" do
      follower = Follower.new({:login=>"katiekeel", :id=>11282627, :avatar_url=>"https://avatars2.githubusercontent.com/u/11282627?v=4", :gravatar_id=>"", :url=>"https://api.github.com/users/katiekeel", :html_url=>"https://github.com/katiekeel", :followers_url=>"https://api.github.com/users/katiekeel/followers", :following_url=>"https://api.github.com/users/katiekeel/following", :gists_url=>"https://api.github.com/users/katiekeel/gists", :starred_url=>"https://api.github.com/users/katiekeel/starred", :subscriptions_url=>"https://api.github.com/users/katiekeel/subscriptions", :organizations_url=>"https://api.github.com/users/katiekeel/orgs"})
      expect(follower.username).to eq("katiekeel")
    end
  end
end
