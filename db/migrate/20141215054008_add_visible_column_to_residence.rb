class AddVisibleColumnToResidence < ActiveRecord::Migration
  def change
  	add_column :residences, :visible, :boolean
  end
end
