class Employee < ApplicationRecord
    has_many :contacts, through: :logs

end
