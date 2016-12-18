#https://dev.twitter.com/rest/public/search --> JSON examples
#client.search("vote ?", geocode:"40.7052529,-74.01407030000001,1mi")

# with since_id of test search
# client.search("vote ?", geocode:"40.7052529,-74.01407030000001,1mi", since_id: 808533717098594304)
test.attrs[:statuses].size --> 100 tweets

test.attrs[:statuses].first

test.attrs[:statuses].find do |tweet|
  tweet[:place] != nil
end

hash.attrs[:statuses].collect do |tweet|
  tweet[:entities][:hashtags]
end

hash.attrs[:statuses][:entities][:hashtags]

results = 
{
  @attrs=
  {:statuses=>
    [{:created_at=>"Tue Dec 13 04:47:14 +0000 2016",
      :id=>808533717098594304,
      :id_str=>"808533717098594304",
      :text=>
       "@rjonesy @markoff Still not convinced?\nhttps://t.co/aZa6dBtChM",
      :truncated=>false,
      :entities=>
       {:hashtags=>[],
        :symbols=>[],
        :user_mentions=>
         [{:screen_name=>"rjonesy",
           :name=>"Ryan Jones",
           :id=>14710664,
           :id_str=>"14710664",
           :indices=>[0, 8]},
          {:screen_name=>"markoff",
           :name=>"John Markoff",
           :id=>1536811,
           :id_str=>"1536811",
           :indices=>[9, 17]}],
        :urls=>
         [{:url=>"https://t.co/aZa6dBtChM",
           :expanded_url=>
            "http://www.detroitnews.com/story/news/politics/2016/12/12/vote-audit/95358702/",
           :display_url=>"detroitnews.com/story/news/pol…",
           :indices=>[39, 62]}]},
      :metadata=>
       {:iso_language_code=>"en", :result_type=>"recent"},
      :source=>
       "<a href=\"http://tapbots.com/software/tweetbot/mac\" rel=\"nofollow\">Tweetbot for Mac</a>",
      :in_reply_to_status_id=>808145568472121344,
      :in_reply_to_status_id_str=>"808145568472121344",
      :in_reply_to_user_id=>14710664,
      :in_reply_to_user_id_str=>"14710664",
      :in_reply_to_screen_name=>"rjonesy",
      :user=>
       {:id=>330496178,
        :id_str=>"330496178",
        :name=>"Zach Kahn",
        :screen_name=>"zkahn",
        :location=>"Manhattan, NY",
          :description=>
         "Brand Partnerships @voxmediainc with the @verge, @polygon, @voxdotcom, and @recode.",
        :url=>"https://t.co/j5SDQmUlTb",
        :entities=>
         {:url=>
           {:urls=>
             [{:url=>"https://t.co/j5SDQmUlTb",
               :expanded_url=>"https://zkahn.me",
               :display_url=>"zkahn.me",
               :indices=>[0, 23]}]},
          :description=>{:urls=>[]}},
        :protected=>false,
        :followers_count=>5074,
        :friends_count=>5322,
        :listed_count=>177,
        :created_at=>"Wed Jul 06 18:16:23 +0000 2011",
        :favourites_count=>78612,
        :utc_offset=>-18000,
        :time_zone=>"Eastern Time (US & Canada)",
        :geo_enabled=>true,
        :verified=>false,
        :statuses_count=>34649,
        :lang=>"en",
        :contributors_enabled=>false,
        :is_translator=>false,
        :is_translation_enabled=>false,
        :profile_background_color=>"3B94D9",
        :profile_background_image_url=>
         "http://pbs.twimg.com/profile_background_images/378800000057551383/78579a40a8f80faa33f4ba5c51302f22.jpeg",
        :profile_background_image_url_https=>
         "https://pbs.twimg.com/profile_background_images/378800000057551383/78579a40a8f80faa33f4ba5c51302f22.jpeg",
        :profile_background_tile=>true,
        :profile_image_url=>
         "http://pbs.twimg.com/profile_images/799098291581550592/KrWSpVgH_normal.jpg",
        :profile_image_url_https=>
         "https://pbs.twimg.com/profile_images/799098291581550592/KrWSpVgH_normal.jpg",
        :profile_banner_url=>
         "https://pbs.twimg.com/profile_banners/330496178/1479354070",
        :profile_link_color=>"37506E",
        :profile_sidebar_border_color=>"FFFFFF",
        :profile_sidebar_fill_color=>"EFEFEF",
        :profile_text_color=>"333333",
        :profile_use_background_image=>false,
        :has_extended_profile=>true,
        :default_profile=>false,
        :default_profile_image=>false,
        :following=>false,
        :follow_request_sent=>false,
        :notifications=>false,
        :translator_type=>"regular"},
      :geo=>nil,
      :coordinates=>nil,
      :place=>
       {:id=>"4d083cc896344b18",
        :url=>
         "https://api.twitter.com/1.1/geo/id/4d083cc896344b18.json",
        :place_type=>"neighborhood",
        :name=>"Financial District",
        :full_name=>"Financial District, Manhattan",
        :country_code=>"US",
        :country=>"United States",
        :contained_within=>[],
        :bounding_box=>
         {:type=>"Polygon",
          :coordinates=>
           [[[-74.017681, 40.699759],
             [-74.001994, 40.699759],
             [-74.001994, 40.717256],
             [-74.017681, 40.717256]]]},
        :attributes=>{}},
      :contributors=>nil,
      :is_quote_status=>false,
      :retweet_count=>0,
      :favorite_count=>0,
      :favorited=>false,
      :retweeted=>false,
      :possibly_sensitive=>false,
      :lang=>"en"}],
   :search_metadata=>
    {:completed_in=>0.092,
     :max_id=>808533717098594304,
     :max_id_str=>"808533717098594304",
     :query=>"vote+%3F",
     :refresh_url=>
      "?since_id=808533717098594304&q=vote%20%3F&geocode=40.70525
29%2C-74.01407030000001%2C1mi&include_entities=1",
     :count=>100,
     :since_id=>0,
     :since_id_str=>"0"}
}=>}