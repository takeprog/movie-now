class TagMap < ApplicationRecord
  belongs_to :movie
  belongs_to :tag
end
