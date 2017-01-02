
class GCAdapter

  def self.find_handles(address)
    rep_hash = GoogleAuth.client.representative_info_by_address(address: "#{address}")
    make_into_array(rep_hash)
  end

  def self.make_into_array(rep_hash)
    #traverse object to pull out all twitter handles
    array = []
    if rep_hash.officials.nil?
      puts "Google API failed. :("
    else
      rep_hash.officials.each do |official|
        if not official.channels.nil?
          official.channels.each do |channel|
            if channel.type == "Twitter"
              array << "@#{channel.id}"
            end
          end
        end
      end

      # if rep_hash.officials[2].channels[1].id.nil? || rep_hash.officials[3].channels[1].id.nil? || rep_hash.officials[4].channels[1].id.nil? || rep_hash.officials[5].channels[1].id.nil?
      
      # else
      #     if rep_hash.officials[2].channels[1].id && rep_hash.officials[3].channels[1].id
      #       array << "@#{rep_hash.officials[2].channels[1].id}, @#{rep_hash.officials[3].channels[1].id}"
      #     end
      #     if rep_hash.officials[4].channels[1].id && rep_hash.officials[5].channels[1].id
      #       array << ", @#{rep_hash.officials[4].channels[1].id} and @#{rep_hash.officials[5].channels[1].id}"
      #     end
      # end
      #Senator 1: rep_hash.officials[2].channels[1].id #"SenSchumer"
      #Senator 2: rep_hash.officials[3].channels[1].id #"SenGillibrand"
      #Rep: rep_hash.officials[4].channels[1].id #repkathleenrice
      #StateRep: #Rep: rep_hash.officials[5].channels[1].id #repkathleenrice

      #code that inserts strings into array
      if not array.nil?
        array.uniq!
        if array.size < 5
          array.take(array.size)
        else
          array.take(5)
        end
      end
    end
  end




end