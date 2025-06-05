class PhotosController < ApplicationController
  before_action :set_gallery
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :authorize_gallery_owner!, only: %i[new create edit update destroy]

  def index
    @photos = @gallery.photos
  end

  def show
    @photo = @gallery.photos.find(params[:id])
  end

  def new
    @photo = @gallery.photos.build
  end

  def create
    puts "hiay"
    @photo = @gallery.photos.build(photo_params)

    if @photo.save
      redirect_to @gallery, notice: "Photo added and cropped successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @photo = @gallery.photos.find(params[:id])
  end

  def update
    @photo = @gallery.photos.find(params[:id])
    if @photo.update(photo_params)
      redirect_to @gallery, notice: "Photo updated and cropped!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @photo = @gallery.photos.find(params[:id])
    @photo.destroy
    redirect_to @gallery, notice: "Photo deleted"
  end

  private

  def set_gallery
    @gallery = Gallery.find(params[:gallery_id])
  end

  def authorize_gallery_owner!
    unless @gallery.user == current_user
      redirect_to root_path, alert: "You are not authorized to perform this action."
    end
  end

  def photo_params
    params.require(:photo).permit(:name, :image)
  end
end
