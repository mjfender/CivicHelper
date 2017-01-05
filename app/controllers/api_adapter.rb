

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


  def self.api_batch(term)
    if lowest_value == ""
      # results =  TwitterAuth.client.search("#{term.concat(" -rt")}", result_type: "recent", geocode: "44.3194372,-76.5948503,200mi", lang: "en")
      results =  TwitterAuth.client.search("#{term.concat(" -rt")}", result_type: "recent", geocode: "41.6005,-93.6091,1000mi", lang: "en")
      # results =  TwitterAuth.client.search("#{term.concat(" -rt")}", result_type: "recent", geocode: "37.7576171,-122.5776844,200mi", lang: "en")

      tweets = results.attrs[:statuses]
    else
      # results =  TwitterAuth.client.search("#{term.concat(" -rt")}", result_type: "recent", lang: "en", max_id: "#{lowest_value.to_i - 1}", geocode: "44.3194372,-76.5948503,200mi")
      results =  TwitterAuth.client.search("#{term.concat(" -rt")}", result_type: "recent", lang: "en", max_id: "#{lowest_value.to_i - 1}", geocode: "41.6005,-93.6091,1250mi")
      # results =  TwitterAuth.client.search("#{term.concat(" -rt")}", result_type: "recent", lang: "en", max_id: "#{lowest_value.to_i - 1}", geocode: "37.7576171,-122.5776844,300mi")

      tweets = results.attrs[:statuses]
    end
    self.process(tweets)
  end

  def self.get_tweets
    count = 0
    while Tweet.all.count <= 100
      term = terms
      api_batch(term)
      count += 1
    end
    Tweet.all
  end

  def self.terms
    terms = ["Donald Trump", "elected", "election", "congress", "\#election2016", "voters", "vote", "voted", "democracy", "officials", "voter suppression", "legislature", "legislation", "EPA", "global warming", "climate change", "inauguration", "civic duty", "democrats", "republicans", "Bernie Sanders", "Hillary Clinton", "senators", "representative", "healthcare", "politics", "political", "voter registration" ]
    terms[rand(27)]
  end

end



#lowest value in tweet.all
