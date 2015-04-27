class AddReviewsToLandlordId < ActiveRecord::Migration
  def change
  	  	add_column :landlords, :review_id, :integer
  end
end
