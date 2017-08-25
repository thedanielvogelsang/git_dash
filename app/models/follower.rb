class Follower
  attr_reader :username, :id, :image, :repos, :url

  def initialize(hash)
    @username = hash[:login]
    @id = hash[:id]
    @image = hash[:avatar_url]
    @repos = hash[:repos_url]
    @url = hash[:html_url]
  end

  def self.create_followers(followers)
    followers.map do |follower|
      Follower.new(follower)
    end
  end
end
