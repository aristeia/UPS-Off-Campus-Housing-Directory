class DashboardController < ApplicationController

	def index
		@landlord_id = 1 #will be changed based on log in information
		@landlord = Landlord.find(@landlord_id)
		@listings = @landlord.residences
		@reviews = @landlord.reviews
	end

  	def new
   	 	@residence = Resience.new
 	end

	def addProperty
		@landlord_id = 1
		@residence = Residence.new
		@residence.save
		@landlord = Landlord.find(@landlord_id)
		@landlord.residences << @residence
		redirect_to dashboard_path(:id => @landlord_id)
	end

	def removeProperty

	end

	def editProperty
		@residence = Residence.find(params[:id])
	end
end
