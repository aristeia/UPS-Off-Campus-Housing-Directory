class LandlordsController < ApplicationController
	def index
		@landlords = Landlord.find(:all)
		@landlords.each do |landlord|
			landlord[:average_score] = landlord.reviews.collect(&:score).sum.to_f/landlord.reviews.length if landlord.reviews.length > 0;
		end
	end
	
	def show
		@landlord_id = params[:id]
		@landlord = Landlord.find(@landlord_id)
		@listings = @landlord.residences
		#Each review has an id...
		@reviews = @landlord.reviews
	end

	#Landlord View Page
	def dashboard
		#if !@current_user.nil? && @current_user.isLandlord?
			@landlord_id = params[:id]
			@landlord = Landlord.find(@landlord_id)
			@listings = @landlord.residences
			@reviews = @landlord.reviews
			render "dashboard/index"
		#else
		#	redirect_to search_path
		#end
	end


end
