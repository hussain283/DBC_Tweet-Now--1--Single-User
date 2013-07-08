class TwitterUser < ActiveRecord::Base
  has_many :tweets

  def fetch_tweets!
    @timeline = Twitter.user_timeline(self.screen_name,{count: 10})

    self.tweets.destroy_all
    @timeline.each do |tweet|
      self.tweets.create(content: tweet.text)
    end

    puts "*" * 100
  end

  def tweets_stale?
    Time.now - self.tweets.first.created_at > 300
  end
end
