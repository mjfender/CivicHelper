require_relative '../config/environment.rb'
require_relative '../app/controllers/api_adapter'

#
gc_client = GoogleAuth.new.connect


ApiAdapter.mother





# http://www.rubydoc.info/github/google/google-api-ruby-client/Google/Apis/CivicinfoV2/CivicInfoService
# https://developers.google.com/civic-information/docs/v2/
gc_client.representative_info_by_address(address: '401 Convent Ave, New York, NY 10031')
