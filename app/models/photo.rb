class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :clips, dependent: :destroy
  has_many :clip_user, through: :clips, source: :user

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  def clip_user(user_id)
    clips.find_by(user_id: user_id)
  end
end