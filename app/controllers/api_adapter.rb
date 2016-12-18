

class ApiAdapter
  #method that continue to pull down tweets until geotagged tweets = 50
  #Tweet.geo_search.count = 50
  #change tweet.search to include max_id - 1 from the last iteration's lowest tweet value


  def self.lowest_value
    if Tweet.all.count == 0
      return ""
    else
      Tweet.all.collect do |tweet|
        tweet.id
      end.sort.first
    end
  end

  def self.process(array)
      array.each do |tweet|
        Tweet.new(tweet)
      end
  end




  def self.api_batch

    if lowest_value == ""
      results =  TwitterAuth.client.search("vote ? -rt", result_type: "recent", geocode: "41.6005,-93.6091,1000mi", lang: "en")
      tweets = results.attrs[:statuses]
    else
      results =  TwitterAuth.client.search("vote ? -rt", result_type: "recent", lang: "en", max_id: "#{lowest_value.to_i - 1}", geocode: "41.6005,-93.6091,1000mi")
      tweets = results.attrs[:statuses]
    end
    self.process(tweets)
  end

  def self.mother
    count = 0
    while Tweet.all.count <= 1
      api_batch
      count += 1
    end
    Tweet.all
  end




end



#lowest value in tweet.all
