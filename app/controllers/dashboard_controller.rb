class DashboardController < ApplicationController

  def index
    @api = GitHubService.new(current_user)
  end

  def show
    api = GitHubService.new(current_user)
    if params['id'] == 'my_feed'
      @recents = api.my_recents
      render 'dashboard/recent_events'
    elsif params['id'] == 'network_feed'
      @recents = api.their_recents
      render 'dashboard/network_events'
    end
  end
end
