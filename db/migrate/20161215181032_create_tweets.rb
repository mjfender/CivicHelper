class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      #hash.attrs[:statuses][*index*]+
      t.integer :tweet_id #[:id]
      t.integer :user_id #[:user][:id]
      t.string :handle  #[:screen_name]
      t.text :text #[:text]
      t.string :language #[:lang]
      t.boolean :geo_point 
      #for "point" geo-tagged tweets, data is like this
      #:geo=>{:type=>"Point", :coordinates=>[40.70513584, -74.01375904]},
      #for "places" and untagged, it is nil
      t.string :geo_coordinates 
      #for "point", data is like this at [:coordinates][:coordinates]
      # --> {:type=>"Point", :coordinates=>[-74.01375904, 40.70513584]}
      # it is nil for places and non-geo
      t.string :place_id  #[:place][:id]
      t.string :place_type #[:place]...
      t.string :place_name #[:place][:name]
      t.string :place_country_code #[:place][:country_code]
      t.string :place_bb_type #[:place][:type]
      t.text :place_bb_coordinates #[:place][:coordinates]
      t.integer :retweet_count #[:retweet_count]
      t.integer :favorite_count #[:favorite:count]
    end
  end
end

#hash.attrs[:search_metadata][:max_id] and [:since_id]