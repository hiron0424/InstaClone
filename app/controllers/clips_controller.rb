class ClipsController < ApplicationController
  before_action :set_photo

  def create
    @clip = Clip.create(user_id: current_user.id, photo_id: params[:photo_id])
    @clips = Clip.where(photo_id: params[:photo_id])
    @photo.reload
  end

  def destroy
    clip = Clip.find_by(user_id: current_user.id, photo_id: params[:photo_id])
    clip.destroy
    @clips = Clip.where(photo_id: params[:photo_id])
    @photo.reload
  end

  private

  def set_photo
    @photo = Photo.find(params[:photo_id])
  end
end
