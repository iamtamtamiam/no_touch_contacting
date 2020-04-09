class Contact < ApplicationRecord
    has_many :logs
    has_many :employees, through: :logs
    

end
