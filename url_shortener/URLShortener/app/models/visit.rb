class Visit < ApplicationRecord

  def self.record_visit!(user, short_url)
    Visit.create!(user_id: user.id, url_id: ShortenedUrl.find_by(short_url).id)
  end

  belongs_to :users,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :site,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :ShortenedUrl
end
