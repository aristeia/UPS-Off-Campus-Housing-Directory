class AddLandlordFieldToUser < ActiveRecord::Migration
  def change
  	add_column :users, :landlord_id, :integer
  end
end
