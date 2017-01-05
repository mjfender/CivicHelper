class Tweet < Twitter::Tweet
  @@ALL = []

  attr_accessor :address, :place, :address
  
  def initialize(hash)
    super
    @address = ""
    @place = ""
    @@ALL << self
  end


  def self.all
    @@ALL
  end

  def self.geo
    geo = all.partition do |tweet|
      tweet.geo.nil?
    end
    # points = geo[1]
    # places = geo[0]
    geo
    #Geocoder.search(array)
    #Geocoder.search([41.6005,-93.6091])
  end


  def self.addresses_from_points
    geo[1].each do |tweet|
      if !Helpee.find_by(user_id: "#{tweet.user.id}")
        address = Geocoder.search(tweet.geo.coordinates)
        if address[0].formatted_address.split.include?("USA")
          tweet.address = address[0].formatted_address
        end
      end
    end
  end

  #for addresses_from_places, getting tweets with tweet.place = nil (nil? = false, empty? = true)
  # in this case, tweet.user.location = city name


  def self.places_and_locations
    places = geo[0].partition do |tweet|
      tweet.place.empty?
    end
    places
    # places[0] = places with location based on profile
    # places[1] = places with tweet.place.bounding_box.coordinates[0].reverse or tweet.place.full_name


    # for Geocoder.search by "Financial District, Manhattan"  -- you get a result back in an array and have to access the first item: result[0].formatted_address (ex: Financial District, New York, NY, USA)

    # for Google API search by just the name..?


  end

  def self.addresses_from_places
   real_places = places_and_locations[1]
   faux_places = places_and_locations[0]


    # first, assign "place" based on a coordinate in the place's GPS polygon bounding box
    real_places.each do |tweet|
      if !Helpee.find_by(user_id: "#{tweet.user.id}")
        search_for = tweet.place.bounding_box.coordinates[0].reverse
        address = Geocoder.search(search_for)
        binding.pry
        if !address[0].nil? && address[0].formatted_address.split.include?("USA")
          tweet.place = address[0].formatted_address
          tweet.geo_place = true
        end
      end
    end

   #next, assign "place" to match city name for tweets with location based on user's profile
    faux_places.each do |tweet|
      if !Helpee.find_by(user_id: "#{tweet.user.id}")
        search_for = tweet.user.location
        address = Geocoder.search(search_for)
        if !address[0].nil? && address[0].formatted_address.split.include?("USA")
          tweet.place = address[0].formatted_address
        end
      end
    end
  
  end


  def self.addresses
    all.select do |tweet|
      tweet.address != ""
    end
  end

  def self.places
    tweets_with_places = all.select do |tweet|
      tweet.place != ""
    end

    tweets_with_places.partition do |tweet|
      tweet.geo_place?
    end

    #Tweet.places[0] = priority
    #Tweet.places[1] = Tweets based on twitter profile
  end

  def self.real_places
    all.select do |tweet|
      tweet.place != ""
    end
  end

end
