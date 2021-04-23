class Comment < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  # アクティブハッシュ
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  validates :text, presence: true

  validates :genre_id, numericality: { other_than: 1 }
end
