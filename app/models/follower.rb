class Follower
  attr_reader :username, :id, :image, :repos

  def initialize(hash)
    @username = hash[:login]
    @id = hash[:id]
    @image = hash[:avatar_url]
    @repos = hash[:repos_url]
  end

end
