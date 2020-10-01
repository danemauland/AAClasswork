# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortenedUrl < ApplicationRecord
    validates :short_url, uniqueness: true, presence: true
    validates :long_url, presence: true

    def self.random_code
        code = SecureRandom.urlsafe_base64(16)
        self.exists?(short_url: code) ? self.random_code : code
    end

    def self.create_short_url(user, long_url)
        self.create! long_url: long_url, short_url: self.random_code, user_id: user.id
    end

    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

    has_many :visits,
        primary_key: :id,
        foreign_key: :shortened_url_id,
        class_name: :Visit

    has_many :visitors,
        through: :visits,
        source: :user

    def num_clicks
        self.visits.count
    end

    def num_uniques
        self.visits.select(:user_id).distinct.count
    end

    def num_recent_uniques
        self.visits.select(:user_id).distinct.where("visits.created_at > ?", 10.minutes.ago).count
    end
    
end


