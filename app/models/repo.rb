class Repo
  attr_reader :name, :uid, :owner, :url, :created_at

  def initialize(repo)
    @uid = repo[:id]
    @name = repo[:name]
    @owner = repo[:owner][:login]
    @url = repo[:html_url]
    time = DateTime.parse(repo[:created_at])
    @created_at = time.strftime('%e-%B-%Y')
  end
end
