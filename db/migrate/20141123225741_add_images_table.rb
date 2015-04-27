class AddImagesTable < ActiveRecord::Migration
    def change
        create_table :images do |t|
            #CREATE TABLE "images" ("residence_id" INTEGER PRIMARY KEY NOT NULL, "file_location" varchar(255), "is_default" boolean);
            t.integer :residence_id
            t.string :file_location
            t.boolean :is_default

            t.timestamps
        end
    end

end
