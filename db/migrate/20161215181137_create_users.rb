class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      #hash.attrs[:statuses][*index*][:user]+
      t.integer :user_id #[:id]
      t.string :handle  #[:screen_name]
      t.text :name #[:name]
      t.string :location #[:location]
      t.string :description #[:description]
      t.integer :follower_count #[:follower_count]
      t.integer :friends_count #[:friends_count]
      t.integer :statuses_count #[:statuses_count]
      t.datetime :join_date #[:created_at]
      t.boolean :geo_enabled #[:geo_enabled]
      t.boolean :verified #[:verified]
      t.string :language #[:lang] - two letter code
    end
  end
end
