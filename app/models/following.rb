class Following
  attr_reader :username, :id, :image, :url
  def initialize(hash)
    @username = hash[:login]
    @id = hash[:id]
    @image = hash[:avatar_url]
    @url = hash[:html_url]
  end

  def self.create_followings(followings)
    followings.map do |user|
      Following.new(user)
    end
  end
end
