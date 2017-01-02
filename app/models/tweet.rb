class Tweet < Twitter::Tweet
  @@ALL = []

  attr_accessor :address
  
  # #belongs_to :user
  # #so, has to find_or_create user whenever new tweet is created. search users by ID.

  def initialize(hash)
    super
    # @id = hash[:id]
    # @user_id = hash[:user][:id]
    # #add method call here to add tweet to user, find or create
    # @text = hash[:text]
    # @langauge = hash[:lang]
    # @point_gps = hash[:geo_point][:coordinates]
    # #looks to be an array, nil if a place or non-geo
    # @place_country = hash[:place][:country_code]
    # @place_name = hash[:place][:name]
    # @place_type = hash[:place][:type]
    # @place_gps = hash[:place][:coordinates]
    # @retweets = hash[:retweet_count]
    # @favorites = hash[:favorite_count]
    @address = ""
    @@ALL << self
  end


  def self.all
    @@ALL
  end

  def self.find_or_create(hash)
  end


  def self.point_geo
    points = all.reject do |tweet|
      tweet.geo.nil?
    end
    points
    #Geocoder.search(array)
    #Geocoder.search([41.6005,-93.6091])
  end

  def self.addresses_from_points
    point_geo.each do |tweet|
      address = Geocoder.search(tweet.geo.coordinates)
      if address[0].formatted_address.split.include?("USA")
        tweet.address = address[0].formatted_address
      end
    end
  end

  def self.addresses
    all.select do |tweet|
      tweet.address != ""
    end
  end


  def self.geo_search
      all.select do |tweet|
        tweet.user.geo_enabled? || tweet.geo != nil || tweet.place != nil
      end
  end


end
