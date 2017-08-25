class DashboardController < ApplicationController

  def index
    @api = GitHubService.new(current_user)
  end

end
