class Pull
  attr_reader :title, :url, :body, :created_at, :merge_sha
  def initialize(pull_hash)
    @title = pull_hash[:title]
    @url = pull_hash[:html_url]
    @body = pull_hash[:body]
      time = DateTime.parse(pull_hash[:created_at])
    @created_at = time.strftime('%e-%B-%Y')
    @merge_sha = pull_hash[:merge_commit_sha]
  end

  def self.find_open_pulls(my_repos, user)
    pull_requests = []
    my_repos.each do |repo|
      pull_requests << GitHubService.repo_pulls(user, repo[:name])
    end
    clean_open_pull_hash(pull_requests)
  end

  def self.clean_open_pull_hash(pull_requests)
    pull_array = pull_requests.flatten
    if pull_array.include?({:message=>"Not Found", :documentation_url=>"https://developer.github.com/v3"})
      pull_array.delete({:message=>"Not Found", :documentation_url=>"https://developer.github.com/v3"})
    else
    end
    create_pulls(pull_array)
  end

  def self.create_pulls(pull_array)
    open_pulls = pull_array.map do |pull|
      Pull.new(pull)
    end
  end

  private_class_method :create_pulls, :clean_open_pull_hash
end
