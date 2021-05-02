class Tag < ApplicationRecord
  has_many :tag_maps
  has_many :movies, through: :tag_maps
  has_many :tag_maped_movies, through: :tag_maps, source: :movie
end
