class Organization
  attr_reader :id, :name, :repos, :public_members

  def initialize(hash)
    @id = hash[:id]
    @name = hash[:login]
    @repos = hash[:repos_url]
    @public_members = hash[:public_members_url][0..-10]
  end

end
