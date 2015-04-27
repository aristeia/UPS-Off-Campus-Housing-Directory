class ReviewsController < ApplicationController
  respond_to :html

  def new
    @review = Review.new
    @landlord = Landlord.find(params[:landlord])
    respond_with(@review)
  end

  def create
    @review = Review.new(params[:review])
    
    if @review.score>5
      @review.score = 5
    end
    if @review.score<0
      @review.score=0
    end

    
    @landlord = Landlord.find(params[:landlord][:id])
    @review.save
    @landlord.reviews << @review
    redirect_to landlord_path(:id => @landlord.id)
  end
end
