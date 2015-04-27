class AddResidenceIdToLandlords < ActiveRecord::Migration
  def change
    add_column :landlords, :residence_id, :integer
  end
end