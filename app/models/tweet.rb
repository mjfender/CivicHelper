class Tweet < Twitter::Tweet
  # include ApiAdapter, TweetsAdapter
  @@ALL = []
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
    @@ALL << self
  end


  def self.all
    @@ALL
  end

  def self.find_or_create(hash)
  end

  def self.geo_search
      all.delete_if do |tweet|
        binding.pry
        tweet.user.geo_enabled == false
      end
       all
  end








end
