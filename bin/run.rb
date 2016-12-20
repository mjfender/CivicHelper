require_relative '../config/environment.rb'
require_relative '../app/controllers/api_adapter'

#
term = CLI.welcome
TwitterAuth.new
# Congress.new
gc_client = GoogleAuth.new.connect

ApiAdapter.mother(term)
# runs API calls until hitting target number of tweets

if Tweet.point_geo.size >= 1
  ResponseController.point_outgoing
else
  CLI.no_points
end

CLI.more_soon
exit


# if CLI.tweet_update
#   ResponseController.create_outgoing
# else
#   binding.pry
# end


# TwitterAuth.client.geo_search(lat:"41.6005", long: "-93.6091")
# This shows places near a GPS coordinate point (Des Moines in this case).
# Can re-order based on user who is logged in

# TwitterAuth.client.reverse_geocode(lat:"41.6005", long: "-93.6091")
# This shows possible place names for a GPS point

# http://www.rubydoc.info/github/google/google-api-ruby-client/Google/Apis/CivicinfoV2/CivicInfoService
# https://developers.google.com/civic-information/docs/v2/
# gc_client.representative_info_by_address(address: '401 Convent Ave, New York, NY 10031')
