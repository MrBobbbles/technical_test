class GalleriesController < ApplicationController
  
  before_action :set_gallery, only: %i[ show edit update destroy ]

  def index
    @galleries = Gallery.all
  end

  def user_galleries
    @galleries = current_user.galleries
  end

  def show

  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = current_user.galleries.new(gallery_params)
    if @gallery.save
      redirect_to @gallery, notice: "Gallery created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    def gallery_params
      params.require(:gallery).permit(:name)
    end

end
