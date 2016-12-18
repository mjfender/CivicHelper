require_relative '../config/environment.rb'

def process(array)
    array.each do |tweet|
      Tweet.new(tweet)
    end
end

twitter_client = TwitterAuth.new.connect
# 
gc_client = GoogleAuth.new.connect

results = twitter_client.search("999123999", result_type: "recent", filter: "safe", lang: "en")
tweets = results.attrs[:statuses]

process(tweets)

binding.pry
# http://www.rubydoc.info/github/google/google-api-ruby-client/Google/Apis/CivicinfoV2/CivicInfoService
# https://developers.google.com/civic-information/docs/v2/
gc_client.representative_info_by_address(address: '401 Convent Ave, New York, NY 10031')







