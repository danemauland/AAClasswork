# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  band_id    :integer          not null
#  title      :string           not null
#  year       :integer          not null
#  live       :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Album < ApplicationRecord
    validates :band_id, presence: true
    validates :title, presence: true
    validates :year, presence: true
    validates :live, inclusion: { in: [true, false]}

    belongs_to :band,
        foreign_key: :band_id,
        class_name: :Band
end
