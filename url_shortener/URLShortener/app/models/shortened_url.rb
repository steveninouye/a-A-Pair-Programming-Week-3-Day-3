# create_table :shortened_urls do |t|
#   t.string :long_url
#   t.string :short_url
#   t.integer :user_id
#   t.timestamps
# end

class ShortenedUrl < ApplicationRecord
  validates :short_url, :long_url, uniqueness: true, presence: true

  def self.create_short_url(user, long_url)
    ShortenedUrl.create!(user_id: user.id, long_url: long_url, short_url: ShortenedUrl.random_code)
  end

  def self.random_code
    while true
      short_url = SecureRandom.urlsafe_base64(4)
      break unless ShortenedUrl.exists?(short_url: short_url)
    end
    short_url
  end

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.visitors.count
  end

  def num_recent_uniques
    self.visitors.where({ updated_at: (10.minutes.ago)..Time.now }).count
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :Visit

  has_many :visitors,
    Proc.new { distinct },
    through: :visits,
    source: :users

  has_many :taggings,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :Tagging

  has_many :tags,
    through: :taggings,
    source: :topics
end
