class Episode < ApplicationRecord
  validates :title, presence: true
  validates :episode_number, presence: true
  validates :picture, presence: true
  validates :rating, presence: true
  validates :summary, presence: true
  validates :season, presence: true
end
