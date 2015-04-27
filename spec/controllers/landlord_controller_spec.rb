require 'rails_helper'

RSpec.describe LandlordsController, :type => :controller do

	let(:valid_attributes) {
		{:name => "Housey McLandlord", :email => "h.mclandlord@besthousing.biz", :phone1 => "(123) 456-7890"}
	}

	let(:valid_session) { {} }

	describe "GET index" do
		it "assigns @landlords with 0 landlords" do
			get :index, {}, valid_session
			expect(assigns(:landlords)).to eq([])
		end

		it "assigns @landlords with 1 landlord" do
			landlord = Landlord.create! valid_attributes
			get :index, {}, valid_session
			expect(assigns(:landlords)).to eq([landlord])
		end

		it "assigns @landlords with 1 landlord" do
			landlord1 = Landlord.create! valid_attributes
			landlord2 = Landlord.create! valid_attributes
			landlord3 = Landlord.create! valid_attributes
			get :index, {}, valid_session
			expect(assigns(:landlords)).to eq([landlord1, landlord2, landlord3])
		end

		it "calculates average score with 0 reviews" do
			landlord = Landlord.create! valid_attributes
			landlord[:average_score] = 0
			get :index, {}, valid_session
			expect(assigns(:landlords)).to eq([landlord])
		end

		it "calculates average score with 1 review" do
			landlord = Landlord.create! valid_attributes
			landlord[:average_score] = 3
			review1 = Review.create! :text => "A review!", :score => 3
			landlord.reviews << review1
			get :index, {}, valid_session
			expect(assigns(:landlords)).to eq([landlord])
		end

		it "calculates average score with 3 reviews" do
			landlord = Landlord.create! valid_attributes
			landlord[:average_score] = 3
			review1 = Review.create! :text => "A review!", :score => 1
			review2 = Review.create! :text => "A review!", :score => 3
			review3 = Review.create! :text => "A review!", :score => 5
			landlord.reviews << review1
			landlord.reviews << review2
			landlord.reviews << review3
			get :index, {}, valid_session
			expect(assigns(:landlords)).to eq([landlord])
		end
	end

	describe "GET show" do
		it "assigns correct landlord" do
			landlord = Landlord.create! valid_attributes
			get :show, {:id => landlord.id}, valid_session
			expect(assigns(:landlord)).to eq(landlord)
		end

		it "assigns correct reviews with 0 reviews" do
			landlord = Landlord.create! valid_attributes
			get :show, {:id => landlord.id}, valid_session
			expect(assigns(:reviews)).to eq([])
		end

		it "assigns correct review with 1 review" do
			landlord = Landlord.create! valid_attributes
			review = Review.create! :text => "A review!", :score => 3
			landlord.reviews << review
			get :show, {:id => landlord.id}, valid_session
			expect(assigns(:reviews)).to eq([review])
		end

		it "assigns correct reviews with 3 reviews" do
			landlord = Landlord.create! valid_attributes
			review1 = Review.create! :text => "A review!", :score => 3
			review2 = Review.create! :text => "A another review!", :score => 5
			review3 = Review.create! :text => "My Great Review", :score => 1
			landlord.reviews << review1
			landlord.reviews << review2
			landlord.reviews << review3
			get :show, {:id => landlord.id}, valid_session
			expect(assigns(:reviews)).to eq([review1, review2, review3])
		end

		it "assigns correct listings with 0 listings" do
			landlord = Landlord.create! valid_attributes
			get :show, {:id => landlord.id}, valid_session
			expect(assigns(:listings)).to eq([])
		end

		it "assigns correct listing with 1 listings" do
			landlord = Landlord.create! valid_attributes
			residence1 = Residence.create! :address => "1234 MyGreat St.", :zipcode => "12345", :bedrooms_available => 5, :am_extra_storage => true, :am_water_included => true
			landlord.residences << residence1
			get :show, {:id => landlord.id}, valid_session
			expect(assigns(:listings)).to eq([residence1])
		end

		it "assigns correct listings with 3 listings" do
			landlord = Landlord.create! valid_attributes
			residence1 = Residence.create! :address => "1234 MyGreat St.", :zipcode => "12345", :bedrooms_available => 5, :am_extra_storage => true, :am_water_included => true
			residence2 = Residence.create! :address => "5678 GreatMy St.", :zipcode => "90867", :bedrooms_available => 0, :am_coin_op_laundry => false, :am_smoke_detector => true
			residence3 = Residence.create! :address => "9999 OhMy Blvd.", :zipcode => "18539", :bedrooms_available => 1, :am_extra_storage => false, :bathrooms => 200
			landlord.residences << residence1
			landlord.residences << residence2
			landlord.residences << residence3
			get :show, {:id => landlord.id}, valid_session
			expect(assigns(:listings)).to eq([residence1, residence2, residence3])
		end
	end

	describe "GET dashboard" do
		it "assigns the correct landlord" do
			landlord = Landlord.create! valid_attributes
			get :dashboard, {:id => landlord.id}, valid_session
			expect(assigns(:landlord)).to eq(landlord)
		end
	end

end
