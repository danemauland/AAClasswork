# == Schema Information
#
# Table name: subs
#
#  id           :bigint           not null, primary key
#  title        :string
#  description  :string
#  moderator_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Sub < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :description, presence: true

    belongs_to :moderator,
        foreign_key: :moderator_id,
        class_name: :User
    
    has_many :post_subs,
        foreign_key: :sub_id,
        class_name: :PostSub 

    has_many :posts,
        through: :post_subs,
        source: :post
end
