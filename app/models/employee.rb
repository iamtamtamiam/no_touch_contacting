class Employee < ApplicationRecord
    has_many :logs 
    has_many :contacts, through: :logs
    
    has_secure_password

end
