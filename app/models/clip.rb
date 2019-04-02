class Clip < ApplicationRecord
  belongs_to :user
  belongs_to :photo, counter_cache: :clips_count
  validates :user_id, presence: true
  validates :photo_id, presence: true
end
