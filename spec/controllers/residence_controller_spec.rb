require 'rails_helper'

RSpec.describe ResidencesController, :type => :controller do

	let(:valid_attributes) {
		{:address => "1234 MyGreat St.", :zipcode => "12345", :bedrooms_available => 5, :am_extra_storage => true, :am_water_included => true}
	}

	let(:valid_session) { {} }

	describe "GET index" do
		it "assigns @residences with 0 residences" do
			get :index, {}, valid_session
			expect(assigns(:residences)).to eq([])
		end

		it "assigns @residences with 1 residence" do
			res1 = Residence.create! valid_attributes
			get :index, {}, valid_session
			expect(assigns(:residences)).to eq([res1])
		end

		it "assigns @residences with 3 residence" do
			res1 = Residence.create! valid_attributes
			res2 = Residence.create! valid_attributes
			res3 = Residence.create! valid_attributes
			get :index, {}, valid_session
			expect(assigns(:residences)).to eq([res1, res2, res3])
		end
	end

	describe "GET show" do

		it "assigns @residence with 1 residence" do
			res1 = Residence.create! valid_attributes
			landlord = Landlord.create! :name => "Landlord McHousing"
			landlord.residences << res1
			get :show, {:id => 1}, valid_session
			expect(assigns(:residence)).to eq(res1)
		end

		it "assigns @residence with 3 residences" do
			res1 = Residence.create! valid_attributes
			res2 = Residence.create! valid_attributes
			res3 = Residence.create! valid_attributes
			landlord = Landlord.create! :name => "Landlord McHousing"
			landlord.residences << res1
			landlord.residences << res2
			landlord.residences << res3
			get :show, {:id => 2}, valid_session
			expect(assigns(:residence)).to eq(res2)
		end
	end

	describe "GET index" do
		it "shows all residences" do
			res1 = Residence.create! valid_attributes
			res2 = Residence.create! valid_attributes
			res3 = Residence.create! valid_attributes
			landlord = Landlord.create! :name => "Landlord McHousing"
			landlord.residences << res1
			landlord.residences << res2
			landlord.residences << res3
			get :index, {}, valid_session
			expect(assigns(:residences)).to eq([res1, res2, res3])
		end

		it "filters properly" do
			res1 = Residence.create! :address => "1234 MyGreat St.", :zipcode => "12345", :bedrooms_available => 5, :miles_from_campus => 1, :am_extra_storage => true, :am_water_included => true, :am_lawn_care_included => true
			res2 = Residence.create! valid_attributes
			res3 = Residence.create! valid_attributes
			landlord = Landlord.create! :name => "Landlord McHousing"
			landlord.residences << res1
			landlord.residences << res2
			landlord.residences << res3
			get :index, {:search => {:am_lawn_care_included => 1, :restype => "Any", :total_monthly_rent => "", :bedrooms_available => "1", :miles_from_campus => "999"}}, valid_session
			expect(assigns(:residences)).to eq([res1])
		end
	end

end
