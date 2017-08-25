class Following
  attr_reader :username, :id, :image, :url
  def initialize(hash)
    @username = hash[:login]
    @id = hash[:id]
    @image = hash[:avatar_url]
    @url = hash[:html_url]
  end

end
