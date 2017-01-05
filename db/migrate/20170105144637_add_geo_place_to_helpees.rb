class AddGeoPlaceToHelpees < ActiveRecord::Migration[5.0]
  def change
    add_column :helpees, :geo_place, :boolean
  end
end
