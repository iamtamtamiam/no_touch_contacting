class Contact < ApplicationRecord
    has_many :logs
    has_many :employees, through: :logs
    
    validates :name, presence: true 

    scope :alpha, -> { order(:name) }

    scope :most_frequent, -> {joins(:logs).group("id").order("count(logs.contact_id)desc")}

end
