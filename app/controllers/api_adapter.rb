

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
      results =  TwitterAuth.client.search("#{term.concat(" -rt")}", result_type: "recent", geocode: "44.3194372,-76.5948503,100mi", lang: "en")
      # results =  TwitterAuth.client.search("#{term.concat(" -rt")}", result_type: "recent", geocode: "41.6005,-93.6091,1000mi", lang: "en")
      tweets = results.attrs[:statuses]
    else
      results =  TwitterAuth.client.search("#{term.concat(" -rt")}", result_type: "recent", lang: "en", max_id: "#{lowest_value.to_i - 1}", geocode: "44.3194372,-76.5948503,100mi")
      # results =  TwitterAuth.client.search("#{term.concat(" -rt")}", result_type: "recent", lang: "en", max_id: "#{lowest_value.to_i - 1}", geocode: "41.6005,-93.6091,1000mi")
      
      tweets = results.attrs[:statuses]
    end
    self.process(tweets)
  end

  def self.mother(term)
    count = 0
    while Tweet.all.count <= 2000
      CLI.count_update
      api_batch(term)
      count += 1
    end
    CLI.count_summary
    Tweet.all
  end




end



#lowest value in tweet.all
