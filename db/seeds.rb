# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

User.create(email: 'admin@example.com', password: 'password', member_of: 'admin')
landlordUser = User.create(email: 'landlord@example.com', password: 'password', member_of: 'landlord')

# Landlord.create(name: "Ambrose Kamaroff", email: "ambrosekamaroff@hotmail.com", phone1: "(253)307-9770")
# Landlord.create(name: "Felton McPhillip", email: "fmcphillip@pugetsound.edu", phone1: "(925)640-9091")
# Landlord.create(name: "Kerry Gilworth", email: "kerrygilworth@comcast.net", phone1: "(253)722-4065")


ambrose = Landlord.new
ambrose.name = "Ambrose Kamaroff"
ambrose.email = "ambrosekamaroff@hotmail.com"
ambrose.phone1 = "(253)307-9770"
ambrose.save

landlordUser.landlord = ambrose
landlordUser.save

felton = Landlord.new
felton.name = "Felton McPhillip"
felton.email = "fmcphillip@pugetsound.edu"
felton.phone1 = "(925)640-9091"
felton.save

kerry = Landlord.new
kerry.name = "Kerry Gilworth"
kerry.email = "kerrygilworth@comcast.net"
kerry.phone1 = "(253)722-4065"
kerry.save

#Reviews
ambroseReview = Review.new 
ambroseReview.text = "Wonderful landlord who was polite and reasonable throughout the year. Easy to contact and very friendly."
ambroseReview.score = 5
ambroseReview.save

ambroseReviewTwo = Review.new 
ambroseReviewTwo.text = "Great landlord, highly reccommended."
ambroseReviewTwo.score = 5
ambroseReviewTwo.save

feltonReview = Review.new
feltonReview.text = "A very meh landlord. We fought on a couple occasions, but we managed to keep things civil throughout the year. Don't ask for anything from him."
feltonReview.score = 3
feltonReview.save

kerryReview = Review.new
kerryReview.score = 1
kerryReview.text = "<script>alert('Damn, son, where'd you find this?');</script>";
kerryReview.save

ambrose.reviews << ambroseReview
ambrose.reviews << ambroseReviewTwo
felton.reviews << feltonReview
kerry.reviews << kerryReview

res1 = Residence.new
res1.visible = true
res1.address = "903 N Lawrence St"
res1.address2 = ""
res1.am_ada_accessible = false
res1.am_cable_tv = false
res1.am_coin_op_laundry = false
res1.am_dishwasher = true
res1.am_electricity_included = false
res1.am_extra_storage = true
res1.am_garbage_included = false
res1.am_internet_included = false
res1.am_laundry = true
res1.am_lawn_care_included = false
res1.am_refrigerator = true
res1.am_sewer_included = false
res1.am_smoke_detector = false
res1.am_smoking_allowed = false
res1.am_stove = true
res1.am_water_included = false
res1.bathrooms = 1
res1.bedrooms_available = 1
res1.bedrooms_total = 5
res1.city = "Tacoma"
res1.description = ""
res1.furnishing = ""
res1.heating_type = "Gas"
res1.lease_term = "5 Months"
res1.miles_from_campus = 0.40
res1.notes = "The room available is a large shared basement with private full bathroom and kitchenette complete with fridge and microwave. The house comes with a very good washing machine and dryer. The main kitchen is huge with a gas range and the house has granite counters and hardwood floor through out. The basement is well lit and has access to the outside. The room can be shared with either a guy or girl as there are two housemates willing to share the room."
res1.parking = ""
res1.restype = "House"
res1.security_deposit = 425
res1.security_deposit_refundable = 425
res1.state = "WA"
res1.total_monthly_rent = 350
res1.zipcode = "98406"

res2 = Residence.new
res2.visible = true
res2.address = "3110 N 15th St"
res2.address2 = ""
res2.am_ada_accessible = false
res2.am_cable_tv = true
res2.am_coin_op_laundry = false
res2.am_dishwasher = true
res2.am_electricity_included = true
res2.am_extra_storage = true
res2.am_garbage_included = true
res2.am_internet_included = true
res2.am_laundry = true
res2.am_lawn_care_included = true
res2.am_refrigerator = true
res2.am_sewer_included = true
res2.am_smoke_detector = true
res2.am_smoking_allowed = false
res2.am_stove = true
res2.am_water_included = true
res2.bathrooms = 2
res2.bedrooms_available = 2
res2.bedrooms_total = 2
res2.city = "Tacoma"
res2.description = ""
res2.furnishing = "Bed, dresser, everything included."
res2.heating_type = "Electric"
res2.lease_term = "Month-To-Month"
res2.miles_from_campus = 0.29
res2.notes = ""
res2.parking = "Other"
res2.restype = "House"
res2.security_deposit = 100
res2.security_deposit_refundable = 100
res2.state = "WA"
res2.total_monthly_rent = 375
res2.zipcode = "98406"

res3 = Residence.new
res3.visible = true
res3.address = "4101 N 13th St"
res3.address2 = ""
res3.am_ada_accessible = false
res3.am_cable_tv = false
res3.am_coin_op_laundry = false
res3.am_dishwasher = true
res3.am_electricity_included = true
res3.am_extra_storage = true
res3.am_garbage_included = true
res3.am_internet_included = false
res3.am_laundry = true
res3.am_lawn_care_included = true
res3.am_refrigerator = true
res3.am_sewer_included = true
res3.am_smoke_detector = false
res3.am_smoking_allowed = false
res3.am_stove = true
res3.am_water_included = true
res3.bathrooms = "1.75"
res3.bedrooms_available = 2
res3.bedrooms_total = 4
res3.city = "Tacoma"
res3.description = ""
res3.furnishing = "Beds, end tables and lamp, vanity, chest of drawers, full length closet.  Furniture available for both rooms."
res3.heating_type = ""
res3.lease_term = "Nine Months To One Year"
res3.miles_from_campus = 0.77
res3.notes = "Larger bedroom is $385 per month and smaller bedroom is $360 per month."
res3.parking = "Other"
res3.restype = "House"
res3.security_deposit = 0
res3.security_deposit_refundable = 0
res3.state = "WA"
res3.total_monthly_rent = 385
res3.zipcode = "98406"

res4 = Residence.new
res4.visible = true
res4.address = "1815 N Adams St"
res4.address2 = ""
res4.am_ada_accessible = false
res4.am_cable_tv = false
res4.am_coin_op_laundry = false
res4.am_dishwasher = false
res4.am_electricity_included = false
res4.am_extra_storage = false
res4.am_garbage_included = false
res4.am_internet_included = false
res4.am_laundry = true
res4.am_lawn_care_included = false
res4.am_refrigerator = true
res4.am_sewer_included = false
res4.am_smoke_detector = false
res4.am_smoking_allowed = false
res4.am_stove = true
res4.am_water_included = false
res4.bathrooms = 2
res4.bedrooms_available = 2
res4.bedrooms_total = 4
res4.city = "Tacoma"
res4.description = ""
res4.furnishing = "Negotiable -- I will be moving to another house in Tacoma, and am flexible, so we can talk!"
res4.heating_type = "Oil"
res4.lease_term = "12 Months"
res4.miles_from_campus = 0.32
res4.notes = "Rent is $400 per bedroom."
res4.parking = ""
res4.restype = "House"
res4.security_deposit = 400
res4.security_deposit_refundable = 400
res4.state = "WA"
res4.total_monthly_rent = 400
res4.zipcode = "98406"

res5 = Residence.new
res5.visible = true
res5.address = "619 S Union Ave"
res5.address2 = ""
res5.am_ada_accessible = false
res5.am_cable_tv = false
res5.am_coin_op_laundry = false
res5.am_dishwasher = true
res5.am_electricity_included = false
res5.am_extra_storage = false
res5.am_garbage_included = false
res5.am_internet_included = false
res5.am_laundry = true
res5.am_lawn_care_included = false
res5.am_refrigerator = true
res5.am_sewer_included = false
res5.am_smoke_detector = true
res5.am_smoking_allowed = false
res5.am_stove = true
res5.am_water_included = false
res5.bathrooms = 2
res5.bedrooms_available = 1
res5.bedrooms_total = 5
res5.city = "Tacoma"
res5.description = ""
res5.furnishing = ""
res5.heating_type = "Gas"
res5.lease_term = "12 Months"
res5.miles_from_campus = 0.44
res5.notes = "Want to have your own room???\r\n\r\nGreat location & house!! \r\nGreat roommates!!\r\n\r\nClose to Univ of Puget Sound.\r\n\r\nWe are looking for person to take over lease.\r\n---\r\nAlmost brand new full bed available for sale - used only for 8 weeks\r\n--\r\nNon-refundable fee is last month's rent"
res5.parking = "Driveway"
res5.restype = "House"
res5.security_deposit = 200
res5.security_deposit_refundable = 200
res5.state = "WA"
res5.total_monthly_rent = 400
res5.zipcode = "98405"

ambrose.residences << res1
ambrose.residences << res2
ambrose.residences << res3
felton.residences << res4
kerry.residences << res5

# images
image1 = Image.create!(:is_default => true)
image1.file_location.store!(File.open(File.join(Rails.root, "public", "imgseeds", "morey_mansion.jpg")))
res1.images << image1

image2 = Image.create!(:is_default => false)
image2.file_location.store!(File.open(File.join(Rails.root, "public", "imgseeds", "panda.jpg")))
res1.images << image2

image3 = Image.create!(:is_default => true)
image3.file_location.store!(File.open(File.join(Rails.root, "public", "imgseeds", "house.jpg")))
res2.images << image3

image4 = Image.create!(:is_default => true)
image4.file_location.store!(File.open(File.join(Rails.root, "public", "imgseeds", "sheldon_hut.jpg")))
res3.images << image4

image5 = Image.create!(:is_default => false)
image5.file_location.store!(File.open(File.join(Rails.root, "public", "imgseeds", "nguyen_shack.jpg")))
res3.images << image5

image6 = Image.create!(:is_default => true)
image6.file_location.store!(File.open(File.join(Rails.root, "public", "imgseeds", "treehouse.jpg")))
res4.images << image6

image7 = Image.create!(:is_default => true)
image7.file_location.store!(File.open(File.join(Rails.root, "public", "imgseeds", "treehouse2.jpg")))
res5.images << image7

