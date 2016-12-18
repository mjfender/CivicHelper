
module ProcessTweets

  def process(array)
    array.each do |tweet|
      Tweet.new(tweet)
    end
  end
end

#pull down tweets on topics
## how && vote // where go vote
#create new objects from tweet objects
#filter for geo info
#have a canned response to reply with