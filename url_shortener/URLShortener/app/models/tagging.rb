class Tagging < ApplicationRecord

  belongs_to :topics,
    primary_key: :id,
    foreign_key: :tag_id,
    class_name: :TagTopic

  belongs_to :urls,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :ShortenedUrl
end
