class GalleriesController < ApplicationController
  before_action :set_gallery, only: %i[ show edit update destroy ]
  before_action :authorize_gallery_owner!, only: %i[edit update destroy]

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
    if @gallery.update(gallery_params)
      redirect_to @gallery
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @gallery.destroy
    redirect_to user_galleries_path
  end


  private
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    def gallery_params
      params.require(:gallery).permit(:name, :description)
    end

    def authorize_gallery_owner!
      unless @gallery.user == current_user
        redirect_to root_path, alert: "You are not authorized to perform this action."
      end
    end
end
