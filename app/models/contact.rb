class Contact < ApplicationRecord
    has_many :employees, through: :logs
    

end
