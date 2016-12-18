class ResponseController



      def self.create_outgoing
        binding.pry
        first_tweet = Tweet.all[5]
        TwitterAuth.client.update("@#{first_tweet.user.screen_name} interested in voting? make sure you're registered at www.vote.org", in_reply_to_status_id: first_tweet.id )

      end


end

####TO DOs
######better filtering, no rt, no replies, show url, parse geodata

#gc_client.representative_info_by_address(address: 'Chandler, AZ').officials[20].channels[1].id
#place Tweet.all.first.place.full_name
