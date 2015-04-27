class ImagesController < ApplicationController

  def show
    id = params[:id]
    @residence_images = Image.where("residence_id="+id.to_s)
  end

end
