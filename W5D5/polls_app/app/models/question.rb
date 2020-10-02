# == Schema Information
#
# Table name: questions
#
#  id       :bigint           not null, primary key
#  poll_id  :integer          not null
#  question :string           not null
#
class Question < ApplicationRecord
    validates :poll_id, presence: true
    validates :question, presence: true
    
    has_many :answer_choices
    belongs_to :poll
end
