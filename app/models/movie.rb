class Movie < ApplicationRecord
  has_many :tag_maps
  has_many :tags, through: :tag_maps

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

end
