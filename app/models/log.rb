class Log < ApplicationRecord
    belongs_to :employee
    belongs_to :contact
    

    validates :date, presence: true
   

    scope :date_ordered, -> { order(date: :desc) }

    scope :both_filters, -> (employee, contact) { where("employee_id = ? AND contact_id = ?", employee, contact) }
    


    def self.by_employee(employee_id)
        where(employee: employee_id)
    end 


    def self.by_contact(contact_id)
        where(contact: contact_id)
    end 

   


end

