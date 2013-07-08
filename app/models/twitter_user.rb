class TwitterUser < ActiveRecord::Base
  has_many :tweets

  def fetch_tweets!
    timeline = Twitter.user_timeline(self.screen_name,{count: 10})
    timeline.reject! {|tweet| self.tweets.find_by_uid(tweet.id)}
    timeline.map {|tweet| self.tweets.create(content: tweet.text,
                                             uid: tweet.attrs[:id_str],
                                             created_at: tweet.created_at)}
  end

  def tweets_stale?
    (Time.now - self.tweets.first.created_at > 300) rescue true
  end
end
