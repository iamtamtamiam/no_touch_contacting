class Log < ApplicationRecord
    belongs_to :employee
    belongs_to :contact
    

    validates :date, presence: true


    scope :date_ordered, -> { order(date: :desc) }
end
