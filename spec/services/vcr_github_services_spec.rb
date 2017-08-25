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
    it "finds first 30 repos" do
      VCR.use_cassette("services/find_repos") do
        api = GitHubService.new(@user)
        repos = api.repos
        repo = repos.first
        expect(repos.count).to eq(30)
        expect(repo.name).to eq("bike-share")
        expect(repo.owner).to eq("DesTodo")
      end
    end
    it 'finds all starred repos' do
      VCR.use_cassette("services/starred_repos") do
        api = GitHubService.new(@user)
        starred = api.starred_repos
        expect(starred.count).to eq(1)
      end
    end
    it 'finds all followers' do
      VCR.use_cassette("services/followers") do
        api = GitHubService.new(@user)
        followers = api.followers
        expect(followers.count).to eq(3)
      end
    end
    it 'finds correct follower' do
      VCR.use_cassette("services/followers") do
        api = GitHubService.new(@user)
        followers = api.followers
        follower = followers.first
        expect(follower.username).to eq('swdonovan')
      end
    end
    it 'finds all users authorized user is following' do
      VCR.use_cassette("services/followings") do
        api = GitHubService.new(@user)
        followings = api.following
        expect(followings.count).to eq(4)
      end
    end
    it 'finds correct user for api.following' do
      VCR.use_cassette("services/followings") do
        api = GitHubService.new(@user)
        followings = api.following
        first_following = followings.first
        expect(first_following[:login]).to eq("katiekeel")
      end
    end
    it 'finds users recent commits' do
      VCR.use_cassette("services/my_activity") do
        api = GitHubService.new(@user)
        recent_commits = api.my_recents
        expect(recent_commits.count).to eq(30)
      end
    end
    it 'finds open repo pulls given repo name' do
      VCR.use_cassette("services/open_pulls") do
        api = GitHubService.new(@user)
        pull_requests = api.open_pull_requests
        expect(pull_requests.count).to eq(1)
      end
    end
  end
end
