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

  private
  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
