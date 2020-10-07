# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#
class ArtworkShare < ApplicationRecord

    validates :artwork_id, presence: true, uniqueness: {scope: :viewer_id}
    validates :viewer_id, presence: true

    belongs_to :viewer,
        foreign_id: :viewer_id,
        class_name: :User

    belongs_to :artwork,
        foreign_id: :artwork_id,
        class_name: :Artwork
end
