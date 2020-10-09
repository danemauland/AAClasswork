# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
    COLORS = %w(black white orange)
    SEX = %w(M F)
    validates :birth_date, presence: true 
    validates :color, presence: true, inclusion: COLORS
    validates :name, presence: true
    validates :sex, presence: true, inclusion: SEX
    validates :description, presence: true
    
    has_many :cat_rental_requests,
        foreign_key: :cat_id,
        class_name: :CatRentalRequest,
        dependent: :destroy

    def age
        ((Date.today - birth_date) / 365.25).to_i
    end

end
