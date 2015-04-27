class ChangeStringsToInts < ActiveRecord::Migration
  def change
  	change_column :residences, :bathrooms, :integer
  	change_column :residences, :security_deposit, :integer
  	change_column :residences, :security_deposit_refundable, :integer
  	change_column :residences, :total_monthly_rent, :integer

  	remove_column :residences, :contact
  end
end
