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

   
    def self.filter_index(params)
        #need to keep params different because of nested route(id) and filter form params
        if !params[:employee].blank? && !params[:contact].blank?
           Log.both_filters(params[:employee], params[:contact]).date_ordered   
        elsif params[:employee_id] 
            Log.by_employee(params[:employee_id]).date_ordered
        elsif !params[:employee].blank?
            Log.by_employee(params[:employee]).date_ordered
        elsif params[:contact_id]
            Log.by_contact(params[:contact_id]).date_ordered
        elsif !params[:contact].blank?
            Log.by_contact(params[:contact]).date_ordered
        else
            Log.all.date_ordered
        end
    end 

end

