
class GCAdapter

  def self.find_handles(address)
    rep_hash = GoogleAuth.client.representative_info_by_address(address: "#{address}")
    make_into_array(rep_hash)
  end

  def self.make_into_array(rep_hash)
    #traverse hash to pull out 1-3 element array with title and twitter handle
    array = []
    if rep_hash.officials[2].channels[1].id
      array << "US Senators: @#{rep_hash.officials[2].channels[1].id} & @#{rep_hash.officials[3].channels[1].id}"
    end
    if rep_hash.officials[4].channels[1].id
      array << "| US Rep: @#{rep_hash.officials[4].channels[1].id}"
    end
    #Senator 1: rep_hash.officials[2].channels[1].id #"SenSchumer"
    #Senator 2: rep_hash.officials[3].channels[1].id #"SenGillibrand"
    #Rep: rep_hash.officials[4].channels[1].id #repkathleenrice
    #StateRep: #Rep: rep_hash.officials[5].channels[1].id #repkathleenrice

    #code that inserts strings into array
    array
  end




end