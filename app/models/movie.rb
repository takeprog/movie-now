class Movie < ApplicationRecord
  has_many :tag_maps
  has_many :tags, through: :tag_maps
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :comments
  has_many :tag_maped_tags, through: :tag_maps, source: :tag

  validates :movie_name, presence: true

  # タグ保存時コード
  def actor_tags_save(tag_list)
    if self.tags != nil
      movie_tags_records = TagMap.where(movie_id: self.id)
      movie_tags_records.destroy_all
    end
    tag_list.each do |tag|
      inspected_tag = Tag.where(actor_tag: tag).first_or_create
      self.tags << inspected_tag
    end
  end
  def genre_tags_save(tag_list)
    if self.tags != nil
      movie_tags_records = TagMap.where(movie_id: self.id)
      movie_tags_records.destroy_all
    end
    tag_list.each do |tag|
      inspected_tag = Tag.where(genre_tag: tag).first_or_create
      self.tags << inspected_tag
    end
  end
  def distribution_tags_save(tag_list)
    if self.tags != nil
      movie_tags_records = TagMap.where(movie_id: self.id)
      movie_tags_records.destroy_all
    end
    tag_list.each do |tag|
      inspected_tag = Tag.where(distribution_site_tag: tag).first_or_create
      self.tags << inspected_tag
    end
  end
  def other_tags_save(tag_list)
    if self.tags != nil
      movie_tags_records = TagMap.where(movie_id: self.id)
      movie_tags_records.destroy_all
    end
    tag_list.each do |tag|
      inspected_tag = Tag.where(other_tag: tag).first_or_create
      self.tags << inspected_tag
    end
  end


  # タグ検索時scope
  scope :having_all_tags_of, ->(*tag_ids) {
    where(id: TagMap.select(:movie_id)
      .where(tag_id: tag_ids)
      .group( :movie_id )
      .having("COUNT(DISTINCT tag_maps.tag_id) = ?", (tag_ids.size-4))
    )
  }
  

  private

   def self.ransackable_scopes(auth_object = nil)
     %i(having_all_tags_of)
   end  
   
end
