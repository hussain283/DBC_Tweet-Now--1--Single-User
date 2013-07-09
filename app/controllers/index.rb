get '/' do
  @user = TwitterUser.new
  @tweets = Tweet.all
  erb :index
end

post '/tweet' do
  Twitter.update(params[:content]);
end

# get '/:username' do
#   @user = TwitterUser.find_or_create_by_screen_name(params[:username])
#   @tweets = @user.tweets.order('created_at DESC').limit(10)
#   erb :index
# end

# get '/:username/get_tweets' do
#   user = TwitterUser.find_by_screen_name(params[:username])
#   content_type :json
#   tweets = user.fetch_tweets! if user.tweets_stale?
#   tweets.reverse.to_json
# end
