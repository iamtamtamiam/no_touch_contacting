class Employee < ApplicationRecord
    has_many :logs 
    has_many :contacts, through: :logs
    
    has_secure_password

    validates :username, presence: true
    validates :username, uniqueness: true
    #should i set email as username for omniauth instead?

end
