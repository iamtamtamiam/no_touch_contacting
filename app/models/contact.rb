class Contact < ApplicationRecord
    has_many :logs
    has_many :employees, through: :logs
    
    validates :name, presence: true 

    scope :alpha, -> { order(:name) }

end
