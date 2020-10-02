# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#
class Response < ApplicationRecord
    validates :user_id, presence: true
    validates :answer_choice_id, presence: true

    belongs_to :answer_choice
    belongs_to :respondent,
        class_name: :User,
        foreign_key: :user_id
    
    def sibling_responses

    end
end
