class AddImageIdToResidences < ActiveRecord::Migration
  def change
  	add_column :residences, :image_id, :integer
  end
end
