class Pull
  attr_reader :title, :url, :body, :created_at, :merge_sha
  def initialize(pull_hash)
    @title = pull_hash[:title]
    @url = pull_hash[:html_url]
    @body = pull_hash[:body]
      time = DateTime.parse(pull_hash[:created_at])
    @created_at = time.strftime('%e %B %Y')
    @merge_sha = pull_hash[:merge_commit_sha]
  end
end
