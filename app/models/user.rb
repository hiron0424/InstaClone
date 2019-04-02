class User < ApplicationRecord
  has_secure_password
  before_validation {email.downcase!}
  validates :password, presence: true, length: {minimum: 6}
  validates :name, presence: true, length: {maximum: 30}
  validates :email, presence: true, length: {maximum: 255},
            format: {with:/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  has_many :photos
  has_many :likes, dependent: :destroy
  has_many :clips, dependent: :destroy
  has_many :clip_photo, through: :clips, source: :photo

  mount_uploader :image, ImageUploader
end