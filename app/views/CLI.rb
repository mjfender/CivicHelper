
class CLI
  @@update_count = 0
  @@mode = ""
  def self.welcome
    puts "-------------------------\n"
    puts "Welcome to CivicHelper!\n"
    puts "-------------------------"
    puts "Please enter a search term or 'exit' to quit."
    puts "(ex: vote, election ?, electoral college)"
    puts "(hint: include ' ?' in your term to look for questions)"
    term = gets.chomp.downcase
    if term == "exit"
      exit
    end
    puts "I'm now searching for tweets..."
    term
  end

  def self.mode
    @@mode
  end

  def self.count_update
    @@update_count += 1
    puts "I just completed an API call to Twitter!"
    puts "Total calls made now #{@@update_count}."
    puts "---------------------------------------------------"
    puts "I have collected #{Tweet.all.count} tweets so far..."
    puts "---------------------------------------------------"
  end

  def self.count_summary
    puts "I have completed the calls to Twitter!"
    puts "Total calls made: #{@@update_count}."
    puts "---------------------------------------------------"
    puts "I collected #{Tweet.all.count} tweets total..."
    puts "Of those, #{Tweet.point_geo.count} have exact geolocation"
    puts "and #{Tweet.all.count} have at least 'place' geolocation."
    puts "---------------------------------------------------"
  end

  def self.no_points
    puts "---------------------------------------------------"
    puts "No exact GPS points found. Skipping 'exact point' mode."
    puts "---------------------------------------------------"
  end

  def self.point_update(tweet_text, tweet)
    response = nil
      puts "------------------ TWEET #{Tweet.addresses.index(tweet)+1} of #{Tweet.addresses.size} -------------------"
      puts "From: @#{tweet.user.screen_name}"
      puts "Text: #{tweet.text}"
      puts "---------------------------------------------------"
      puts "Address found using GPS Point:"
      puts "#{tweet.address}"
      puts "---------------------------------------------------"
      puts "Proposed tweet to #{tweet.user.screen_name}:"
      puts "#{tweet_text}"
      puts "---------------------------------------------------"
     while response != 'send' && response != 'skip' && response != 'switch' && response != 'exit'
      puts "Would you like to SEND the proposed tweet or SKIP to next?"
      print "Type 'SEND' or 'SKIP' -- or type EXIT to end!"
      response = gets.chomp.downcase
    end

    if response.downcase == "send"
      puts "Sending tweet to @#{tweet.user.screen_name}"
      true
    elsif response.downcase == "skip"
      false
    elsif response.downcase == "switch"
      @@mode = "place"
      false
    elsif response.downcase == "exit"
      exit
    end
  end

    def self.more_soon
      puts "---------------------------------------------------"
      puts "That's all for now! Stay tuned for more...."
      puts "#ThankYou #CivicHelper #TwitterBots"
      puts "---------------------------------------------------"
    end
  # def self.tweet_update
  #   response = nil
  #   while response == nil
  #     print "Would you like to send a tweet? ('Y', 'N' or 'Exit')"
  #     response = gets.chomp
  #   end

  #   if response.downcase == "y"
  #     puts "Sending tweet to"
  #     true
  #   elsif response.downcase == "n"
  #     puts "Entering console mode"
  #     binding.pry
  #   elsif response.downcase == "exit"
  #     exit
  #   end

  # end


end