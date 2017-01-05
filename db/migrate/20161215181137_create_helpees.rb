class CreateHelpees < ActiveRecord::Migration[5.0]
  def change
    create_table :helpees do |t|
      #hash.attrs[:statuses][*index*][:user]+
      t.string :user_id #[:id]
      t.string :tweet_id
      t.string :handle  #[:screen_name]
      t.text :place #name of place
      t.text :address #address from GeoCoder
      t.text :reps #from Google API
      t.text :other_reps #any handles over 4
      t.text :name #[:name]
      t.string :location #[:location]
      t.string :description #[:description]
      t.string :followers_count #[:follower_count]
      t.string :statuses_count #[:statuses_count]
      t.string :join_date #[:created_at]
      t.boolean :geo_enabled #[:geo_enabled]
      t.boolean :verified #[:verified]
      t.string :language #[:lang] - two letter code
      t.timestamps null: false
    end
  end
end
