# == Schema Information
#
# Table name: users
#
#  id       :bigint           not null, primary key
#  username :string           not null
#
class User < ApplicationRecord
    validates :username, uniqueness: true, presence: true

    has_many :authored_polls,
        class_name: :Poll,
        foreign_key: :user_id

    has_many :responses
end
