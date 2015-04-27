class CreateFinances < ActiveRecord::Migration
  def change
    create_table :finances do |t|
      t.integer :landlord_id
      t.datetime :datepaid
      t.float :amount

      t.timestamps
    end
  end
end
