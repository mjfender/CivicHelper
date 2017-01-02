class ResponseController



  def self.create_outgoing
    first_tweet = Tweet.all[5]
    TwitterAuth.client.update("@#{first_tweet.user.screen_name} interested in voting? make sure you're registered at www.vote.org", in_reply_to_status_id: first_tweet.id )
  end

  def self.point_outgoing
    Tweet.addresses_from_points
    Tweet.addresses.each do |tweet|
      if CLI.mode == "place"
        break
      end
      rep_array = GCAdapter.find_handles(tweet.address) #pry after this
      tweet_text = "@#{tweet.user.screen_name} Elected officials where you tweeted this include: #{rep_array.join(", ")}!"
      #call CLI with argument of tweet, should return Y or N
      if CLI.point_update(tweet_text, tweet)
        TwitterAuth.client.update("#{tweet_text}", in_reply_to_status_id: tweet.id )
      end
    end
  end


end

####TO DOs
######better filtering, no rt, no replies, show url, parse geodata

#gc_client.representative_info_by_address(address: 'Chandler, AZ').officials[20].channels[1].id
#place Tweet.all.first.place.full_name
