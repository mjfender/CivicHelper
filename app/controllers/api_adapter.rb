

class ApiAdapter
  #method that continue to pull down tweets until geotagged tweets = 50
  #Tweet.geo_search.count = 50
  #change tweet.search to include max_id - 1 from the last iteration's lowest tweet value
  def self.lowest_value
    if Tweet.all == 0
      return ""
    else
      Tweet.all.collect do |tweet|
        tweet.id
      end.sort.first.to_i - 1
    end
  end

  def self.process(array)
      array.each do |tweet|
        Tweet.new(tweet)
      end
  end



  def self.api_batch
    twitter_client = TwitterAuth.new.connect
    results = twitter_client.search("vote", result_type: "recent", filter: "safe", lang: "en", max_id: "#{lowest_value}", geocode: "41.6005, 93.6091, 100mi")
    tweets = results.attrs[:statuses]
    self.process(tweets)
    geo_tweets = Tweet.geo_search
  end

  def self.mother
    count = 0
    while Tweet.geo_search.count < 300
      api_batch
      count += 1

    end
    all
  end




end



#lowest value in tweet.all
