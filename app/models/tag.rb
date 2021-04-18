class Tag < ApplicationRecord
  has_many :tag_maps
  has_many :movies, through: :tag_maps
end
