class GitHubService
  attr_reader :connection, :current_user

  def initialize(user)
    @connection = Faraday.new("https://api.github.com")
    @current_user = user
  end

  def self.find_all_users(user)
    new(user).find_all_users(user)
  end

  def find_all_users(user)
    parse connection.get("/users?access_token=#{current_user.token}")
  end

  def repos
    repos_hash = parse connection.get("/user/repos?access_token=#{current_user.token}")
    Repo.create_repos(repos_hash)
  end

  def starred_repos
    repos = parse connection.get("/user/starred?access_token=#{current_user.token}")
    Repo.create_repos(repos)
  end

  def followers
    followers = parse connection.get("/user/followers?access_token=#{current_user.token}")
    Follower.create_followers(followers)
  end

  def following
    followings = parse connection.get("/user/following?access_token=#{current_user.token}")
    Following.create_followings(followings)
  end

  def my_recents
    recents = parse connection.get("/users/#{current_user.username}/events?access_token=#{current_user.token}")
    Commit.create_commits(recents)
  end

  def their_recents
    recents = parse connection.get("/users/#{current_user.username}/received_events?access_token=#{current_user.token}")
    Commit.create_commits(recents)
  end

  def organizations
    orgs = parse connection.get("/user/orgs?access_token=#{current_user.token}")
    Organization.create_organizations(orgs)
  end

  def new_repo(name)
    parse connection.post("/user/repos?scope=repo&access_token=#{current_user.token}&name=#{name}")
  end

  def open_pull_requests
    my_repos = parse connection.get("/user/repos?access_token=#{current_user.token}")
    Pull.find_open_pulls(my_repos, current_user)
  end

  def self.repo_pulls(current_user, repo)
    new(current_user).repo_pulls(repo)
  end

  def repo_pulls(repo)
    parse connection.get("/repos/#{current_user.username}/#{repo}/pulls?access_token=#{current_user.token}")
  end

  private
  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
