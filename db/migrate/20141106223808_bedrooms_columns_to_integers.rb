class BedroomsColumnsToIntegers < ActiveRecord::Migration
	def change
		change_column :residences, :bedrooms_available, :integer
  		change_column :residences, :bedrooms_total, :integer
	end
end
