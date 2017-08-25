class Commit
  attr_reader :id, :type, :username, :repo, :repo_name, :created_at

  def initialize(hash)
    @id = hash[:id]
    @type = hash[:type]
    @username = hash[:actor][:login]
    @repo = hash[:repo][:url]
    @repo_name = hash[:repo][:name]
    time = DateTime.parse(hash[:created_at])
    @created_at = time.strftime('%e %B %Y')
  end

  def self.create_commits(commit_hash)
    commit_hash.map do |commit|
      Commit.new(commit)
    end
  end
end
