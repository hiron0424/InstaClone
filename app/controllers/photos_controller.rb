class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy ]

  # GET /photosa
  # GET /photos.json
  def index
    @photos = Photo.all
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @clip = current_user.clips.find_by(photo_id: @photo.id)
  end

  # GET /photos/new
  def new
    if params[:back]
      @photo = Photo.new(photo_params)
    else
      @photo = Photo.new
    end
  end

  def confirm
    @photo = current_user.photos.new(photo_params)
    render :new if @photo.invalid?
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = current_user.photos.new(photo_params)

    respond_to do |format|
      if @photo.save
        # ContactMailer.post_photo(@photo).deliver_now
        format.html { redirect_to photos_path(current_user.id), notice: '画像投稿が完了しました' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    if @photo.user_id == current_user.id
      respond_to do |format|
        if @photo.update(photo_params)
          format.html { redirect_to @photo, notice: '画像更新が完了しました' }
          format.json { render :show, status: :ok, location: @photo }
        else
          format.html { render :edit }
          format.json { render json: @photo.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to @photo, notice: 'ご自身の投稿以外は編集できません！'
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    if @photo.user_id == current_user.id
      @photo.destroy
      respond_to do |format|
        format.html { redirect_to photos_url, notice: '投稿を削除しました.' }
        format.json { head :no_content }
      end
    else
      redirect_to @photo, notice: 'ご自身の投稿以外は削除できません！'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_photo
    @photo = Photo.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def photo_params
    params.require(:photo).permit(:description, :image, :image_cache)
  end
end