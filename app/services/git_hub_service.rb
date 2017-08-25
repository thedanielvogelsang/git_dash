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
    create_repos(repos_hash)
  end

  def starred_repos
    parse connection.get("/user/starred?access_token=#{current_user.token}")
  end

  def followers
    followers = parse connection.get("/user/followers?access_token=#{current_user.token}")
    create_followers(followers)
  end

  def following
    parse connection.get("/user/following?access_token=#{current_user.token}")
  end

  def my_recents
    parse connection.get("/users/#{current_user.username}/events?access_token=#{current_user.token}")
  end

  def their_recents
    parse connection.get("/users/#{current_user.username}/received_events?access_token=#{current_user.token}")
  end

  def organizations
    orgs = parse connection.get("/user/orgs?access_token=#{current_user.token}")
    byebug
  end

  def new_repo(name)
    parse connection.post("/user/repos?scope=repo&access_token=#{current_user.token}&name=#{name}")
  end

  def open_pull_requests
    pull_requests = []
    my_repos = parse connection.get("/user/repos?access_token=#{current_user.token}")
    my_repos.each do |repo|
      pull_requests << repo_pulls(repo[:name])
    end
    clean_open_pull_hash(pull_requests)
  end

  def repo_pulls(repo)
    parse connection.get("/repos/#{current_user.username}/#{repo}/pulls?access_token=#{current_user.token}")
  end

  def clean_open_pull_hash(pull_requests)
    pull_array = pull_requests.flatten
    if pull_array.include?({:message=>"Not Found", :documentation_url=>"https://developer.github.com/v3"})
      pull_array.delete({:message=>"Not Found", :documentation_url=>"https://developer.github.com/v3"})
    else
    end
    create_pulls(pull_array)
  end

  def create_pulls(pull_array)
    open_pulls = pull_array.map do |pull|
      Pull.new(pull)
    end
  end

  def create_repos(repos_hash)
    repos_hash.map do |repo|
      Repo.new(repo)
    end
  end

  def create_followers(followers)
    followers.map do |follower|
      Follower.new(follower)
    end
  end

  private
  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
