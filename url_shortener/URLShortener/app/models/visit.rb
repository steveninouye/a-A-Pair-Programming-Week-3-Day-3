class Visit < ApplicationRecord

  def self.record_visit!(user, short_url)
    url = ShortenedUrl.find_by(short_url: short_url)
    Visit.create!(visitor_id: user.id, url_id: url.id)
  end

  belongs_to :users,
    primary_key: :id,
    foreign_key: :visitor_id,
    class_name: :User

  belongs_to :site,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :ShortenedUrl
end
