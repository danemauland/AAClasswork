# == Schema Information
#
# Table name: comments
#
#  id           :bigint           not null, primary key
#  commenter_id :integer          not null
#  artwork_id   :integer          not null
#  body         :string           not null
#
class Comment < ApplicationRecord 
    validates :commenter_id, presence: true
    validates :artwork_id, presence: true
    validates :body, presence: true

    belongs_to :commenter,
        foreign_key: :commenter_id,
        class_name: :User 

    belongs_to :artwork,
        foreign_key: :artwork_id,
        class_name: :Artwork
end
