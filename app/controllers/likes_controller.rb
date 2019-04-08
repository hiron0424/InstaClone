class LikesController < ApplicationController
  before_action :set_photo

  def create
    @like = Like.create(user_id: current_user.id, photo_id: params[:photo_id])
    @likes = Like.where(photo_id: params[:photo_id])
    if @like.save
      @photo.reload
    else
      @photo.reload
    end
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, photo_id: params[:photo_id])
    like.destroy
    @likes = Like.where(photo_id: params[:photo_id])
    @photo.reload
  end

  private

  def set_photo
    @photo = Photo.find(params[:photo_id])
  end

end