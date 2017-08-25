class Organization
  attr_reader :id, :name, :repos, :public_members, :url

  def initialize(hash)
    @id = hash[:id]
    @name = hash[:login]
    @repos = hash[:repos_url]
    @url = hash[:url]
    @public_members = hash[:public_members_url][0..-10]
  end

  def self.create_organizations(orgs)
    orgs.map do |org|
      Organization.new(org)
    end
  end
end
