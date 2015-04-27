class CreateLandlords < ActiveRecord::Migration
    def change
        create_table :landlords do |t|
            
            t.string :name
            t.string :email
            t.string :phone1
            t.string :phone2

            t.timestamps
        end
    end
end
