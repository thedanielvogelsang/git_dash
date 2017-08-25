class SessionsController < ApplicationController

  def create
    response = Faraday.post("https://github.com/login/oauth/access_token?client_id=#{ENV['github_client_id']}&client_secret=#{ENV['github_client_secret']}&code=#{params['code']}")
    @token = response.body.split(/\W+/)[1]
    oauth_response = Faraday.get("https://api.github.com/user?access_token=#{@token}")
    auth = JSON.parse(oauth_response.body)
    associate_user(auth)
    redirect_to dashboard_index_path
  end

  def associate_user(auth)
    user = User.find_or_create_by(uid: auth['id'])
    user.uid = auth['id']
    user.username = auth['login']
    user.token = @token
    user.image = auth['avatar_url']
    user.save
    session[:user_id] = user.id
  end
end
