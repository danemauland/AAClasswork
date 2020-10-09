# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CatRentalRequest < ApplicationRecord
    STATUSES = %w(APPROVED DENIED PENDING)
    validates :cat_id, presence: true 
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :status, presence: true, inclusion: STATUSES

    belongs_to :cat

    # need a different request
    #for same cat
    #overlaps
    def overlapping_requests
        CatRentalRequest
            .where(cat_id: cat_id).where.not(id: id)
            .where.not("#{start_date} BETWEEN start_date and end_date")
            .where.not("#{end_date} BETWEEN start_date and end_date")
                                                                                    
    end
end
