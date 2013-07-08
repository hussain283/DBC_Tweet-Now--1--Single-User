get '/' do
  erb :index
end

get '/:username' do
  @user = TwitterUser.find_or_create_by_screen_name(params[:username])
  @user.fetch_tweets! if @user.tweets.empty?
  @user.fetch_tweets! if @user.tweets_stale?
  @tweets = @user.tweets.limit(10)
  erb :index
end
