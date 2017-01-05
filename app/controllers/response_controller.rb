class ResponseController


  def self.point_outgoing
    Tweet.addresses_from_points
    Tweet.addresses.each do |tweet|
      rep_array = GCAdapter.find_handles(tweet.address)
      #rep_array is ALL unique twitter handles

      if rep_array.size < 4
        rep_string = rep_array.take(rep_array.size).join(", ")
        other_reps = ""
      else
        rep_string = rep_array.take(4).join(", ")
        other_reps = rep_array[rep_array.size * -1 + 4..rep_array.size].join(", ")
      end
      
      tweet_text = "@#{tweet.user.screen_name} Elected officials where you tweeted this include: #{rep_string}!"
      #call CLI with argument of tweet, should return Y or N
      TwitterAuth.client.update("#{tweet_text}", in_reply_to_status_id: tweet.id )
      persist_outgoing(tweet, rep_string, other_reps)
      sleep_rest
    end
  end

  def self.place_outgoing
    Tweet.addresses_from_places
    #These are the tweets with "real" place geodata
    Tweet.places[0].each do |tweet|
      rep_array = GCAdapter.find_handles(tweet.place)
      
      if rep_array.size < 4
        rep_string = rep_array.take(rep_array.size).join(", ")
        other_reps = ""
      else
        rep_string = rep_array.take(4).join(", ")
        other_reps = rep_array[rep_array.size * -1 + 4..rep_array.size].join(", ")
      end

      tweet_text = "@#{tweet.user.screen_name} Elected officials where you tweeted this include: #{rep_string}!"
      TwitterAuth.client.update("#{tweet_text}", in_reply_to_status_id: tweet.id )
      sleep_rest
      persist_outgoing(tweet, rep_string, other_reps)
    end

    #These are tweets with locations based on profile
    Tweet.places[1].each do |tweet|
      rep_array = GCAdapter.find_handles(tweet.place)
      
      if rep_array.size < 4
        rep_string = rep_array.take(rep_array.size).join(", ")
        other_reps = ""
      else
        rep_string = rep_array.take(4).join(", ")
        other_reps = rep_array[rep_array.size * -1 + 4..rep_array.size].join(", ")
      end

      tweet_text = "@#{tweet.user.screen_name} Elected officials where you tweeted this include: #{rep_string}!"
      TwitterAuth.client.update("#{tweet_text}", in_reply_to_status_id: tweet.id )
      sleep_rest
      persist_outgoing(tweet, rep_string, other_reps)
    end
  end

  def self.sleep_rest
    sleep(rand(43))
  end

  def self.persist_outgoing(tweet, reps, other_reps)
    new_helpee = Helpee.new(parse_for_save(tweet, reps, other_reps))
    new_helpee.save
  end

  def self.parse_for_save(tweet, reps, other_reps)
      hash = {}
      hash[:handle] = tweet.user.screen_name
      hash[:user_id] = tweet.user.id
      hash[:tweet_id] = tweet.id
      hash[:reps] = reps
      if tweet.place
        hash[:place] = tweet.place
      elsif tweet.address
        hash[:address] = tweet.address
      end
      hash[:other_reps] = other_reps
      hash[:name] = tweet.user.name
      hash[:location] = tweet.user.location
      hash[:description] = tweet.user.description
      hash[:followers_count] = tweet.user.followers_count
      hash[:statuses_count] = tweet.user.statuses_count
      hash[:join_date] = tweet.user.created_at
      hash[:geo_enabled] = tweet.user.geo_enabled?
      hash[:verified] = tweet.user.verified?
      hash[:language] = tweet.user.lang
      hash
  end

end