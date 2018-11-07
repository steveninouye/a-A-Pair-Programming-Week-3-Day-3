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
      break unless ActiveRecord.exists?(short_url: short_url)
    end
    short_url
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
end
