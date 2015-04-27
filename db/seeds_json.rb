# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

User.create(email: 'admin@example.com', password: 'password')


json = JSON.parse File.open("#{Dir.pwd}/db/residences.json").read

json["residences"].each do |r|

	Residence.create(address: r["address"],
		address2: r["address2"],
		am_ada_accessible: r["am_ada_accessible"],
		am_cable_tv: r["am_cable_tv"],
		am_coin_op_laundry: r["am_coin_op_laundry"],
		am_dishwasher: r["am_dishwasher"],
		am_electricity_included: r["am_electricity_included"],
		am_extra_storage: r["am_extra_storage"],
		am_garbage_included: r["am_garbage_included"],
		am_internet_included: r["am_internet_included"],
		am_laundry: r["am_laundry"],
		am_lawn_care_included: r["am_lawn_care_included"],
		am_refrigerator: r["am_refrigerator"],
		am_sewer_included: r["am_sewer_included"],
		am_smoke_detector: r["am_smoke_detector"],
		am_smoking_allowed: r["am_smoking_allowed"],
		am_stove: r["am_stove"],
		am_water_included: r["am_water_included"],
		bathrooms: r["bathrooms"], 
		bedrooms_available: r["bedrooms_available"], 
		bedrooms_total: r["bedrooms_total"], 
		city: r["city"], 
		#contact: "Rayne Ellington-Lawrence""], 
		description: r["description"], 
		furnishing: r["furnishing"], 
		heating_type: r["heating_type"], 
		lease_term: r["lease_term"], 
		miles_from_campus: r["miles_from_campus"], 
		notes: r["notes"], 
		parking: r["parking"], 
		restype: r["restype"], 
		security_deposit: r["security_deposit"], 
		security_deposit_refundable: r["security_deposit_refundable"], 
		state: r["state"], 
		total_monthly_rent: r["total_monthly_rent"], 
		zipcode: r["zipcode"]);
end
