# == Schema Information
#
# Table name: users
#
#  id       :bigint           not null, primary key
#  username :string           not null
#
class User < ApplicationRecord 
    
    def self.search_by_name(str)
        self.find_by("username iLIKE '%#{str}%'")
    end

    validates :username, presence: true, uniqueness: true

    has_many :artworks,
        foreign_key: :artist_id,
        class_name: :Artwork,
        dependent: :destroy
    
    has_many :dumb_association_name,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare,
        dependent: :destroy

    has_many :shared_artworks,
        through: :dumb_association_name,
        source: :artwork 

    has_many :comments,
        foreign_key: :commenter_id,
        class_name: :Comment,
        dependent: :destroy

end
