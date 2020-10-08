# == Schema Information
#
# Table name: artworks
#
#  id        :bigint           not null, primary key
#  title     :string           not null
#  image_url :string           not null
#  artist_id :integer          not null
#
class Artwork < ApplicationRecord 

    def self.associated_with_user_id(user_id)
        self.left_joins(:shared_artworks)
        .where("artworks.artist_id = #{user_id} OR viewer_id = #{user_id}")
    end
    validates :title, presence: true, uniqueness: {scope: :artist_id}
    validates :artist_id, presence: true
    validates :image_url, presence: true

    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User

    has_many :shared_artworks,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare

    has_many :shared_viewers,
        through: :shared_artworks,
        source: :viewer

    has_many :comments,
        foreign_key: :artwork_id,
        class_name: :Comment,
        dependent: :destroy
end
