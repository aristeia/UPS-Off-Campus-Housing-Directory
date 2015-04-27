class AddLandlordIdToReviews < ActiveRecord::Migration
  def change
  	    add_column :reviews, :landlord_id, :integer
  end
end
