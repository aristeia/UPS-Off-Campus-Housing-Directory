class CreateResidences < ActiveRecord::Migration	
  def change	
    create_table :residences do |t|	
      t.string :address,:default => ""
      t.string :address2 ,:default =>""
      t.string :city ,:default =>""
      t.string :state ,:default =>""
      t.string :zipcode ,:default =>""
      t.string :slug ,:default =>""
      t.string :restype ,:default =>""
      t.string :bedrooms_available ,:default =>0
      t.string :bedrooms_total ,:default =>0
      t.string :bathrooms ,:default =>0
      t.float :miles_from_campus ,:default =>0
      t.integer :total_monthly_rent ,:default =>0
      t.string :arrangement ,:default =>""
      t.text :description ,:default =>""
      t.text :notes ,:default =>""
      t.text :furnishing ,:default =>""
      t.string :parking ,:default =>""
      t.date :available ,:default =>""
      t.string :lease_term ,:default =>""
      t.integer :security_deposit ,:default =>0
      t.integer :security_deposit_refundable	 ,:default =>0
      t.string :heating_type	 ,:default =>""
      t.boolean :am_laundry	 ,:default =>false
      t.boolean :am_coin_op_laundry	 ,:default =>false
      t.boolean :am_extra_storage	 ,:default =>false
      t.boolean :am_cable_tv	 ,:default =>false
      t.boolean :am_smoking_allowed	 ,:default =>false
      t.boolean :am_smoke_detector	 ,:default =>false
      t.boolean :am_ada_accessible	 ,:default =>false
      t.boolean :am_internet_included	 ,:default =>false
      t.boolean :am_stove	 ,:default =>false
      t.boolean :am_refrigerator	 ,:default =>false
      t.boolean :am_dishwasher	 ,:default =>false
      t.boolean :am_lawn_care_included	 ,:default =>false
      t.boolean :am_water_included	 ,:default =>false
      t.boolean :am_sewer_included	 ,:default =>false
      t.boolean :am_garbage_included	 ,:default =>false
      t.boolean :am_electricity_included	 ,:default =>false
      t.boolean :visible, :default => false
      t.timestamps
    end	
  end	
end
