class AddLandlordIdToResidences < ActiveRecord::Migration
  def change
    add_column :residences, :landlord_id, :integer
  end
end