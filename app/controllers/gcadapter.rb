
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

      if not array.nil?
        array.uniq!.shuffle
      end
    end
  end




end