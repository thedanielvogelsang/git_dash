require 'rails_helper'

RSpec.describe Organization, type: :model do
  context "validations"
  it "can call a valid members url" do
    organization = Organization.new({:login=>"1705-BE", :id=>31317089, :url=>"https://api.github.com/orgs/1705-BE", :repos_url=>"https://api.github.com/orgs/1705-BE/repos", :events_url=>"https://api.github.com/orgs/1705-BE/events", :hooks_url=>"https://api.github.com/orgs/1705-BE/hooks", :issues_url=>"https://api.github.com/orgs/1705-BE/issues", :members_url=>"https://api.github.com/orgs/1705-BE/members{/member}", :public_members_url=>"https://api.github.com/orgs/1705-BE/public_members{/member}", :avatar_url=>"https://avatars1.githubusercontent.com/u/31317089?v=4", :description=>"1705 BackEnd Group"})
    expect(organization.class).to be(Organization)
    expect(organization.public_members).to eq("https://api.github.com/orgs/1705-BE/public_members")
  end
end
