# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string
#  url        :string
#  content    :text
#  sub_id     :integer
#  author_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
    validates :title, presence: true
    validates :url, uniqueness: true
    # validates :post_subs, length: { minimum: 1 }

    has_many :subs,
        through: :post_subs,
        source: :sub
    
    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User

    has_many :post_subs,
        foreign_key: :post_id,
        class_name: :PostSub
end
