# == Schema Information
#
# Table name: polls
#
#  id      :bigint           not null, primary key
#  user_id :integer          not null
#  title   :string           not null
#
class Poll < ApplicationRecord
    validates :user_id, presence: true
    validates :title, presence: true

    belongs_to :author,
        class_name: :User,
        foreign_key: :user_id

    has_many :questions
end
