class TagTopic < ApplicationRecord
  validates: :tag, uniqueness: true

  has_many :taggings,
    primary_key: :id,
    foreign_key: :tag_id,
    class_name: :Tagging

  has_many :urls,
    through: :taggings,
    source: :urls
end
