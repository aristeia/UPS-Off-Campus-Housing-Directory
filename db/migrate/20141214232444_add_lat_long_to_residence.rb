class AddLatLongToResidence < ActiveRecord::Migration
  def change
    add_column :residences, :latitude, :float
    add_column :residences, :longitude, :float
  end
end
