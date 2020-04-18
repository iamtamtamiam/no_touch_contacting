class LogsController < ApplicationController
    
    before_action :redirect_if_not_logged_in
    before_action :set_log_by_id, only: [:show, :edit, :update, :destroy]
    before_action :set_all_contacts, only: [:index, :new, :create, :edit, :update]

    layout 'layouts/user'

    
    
    def index
        #nested routes
        @employees = Employee.all
        
        #need to keep params different because of nested route and form params
        if !params[:employee].blank? && !params[:contact].blank?
            @logs = Log.both_filters(params[:employee], params[:contact]).date_ordered
            #@logs = Log.where("employee_id = ? AND contact_id = ?", params[:employee], params[:contact]).date_ordered
        elsif params[:employee_id] 
            @logs = Log.by_employee(params[:employee_id]).date_ordered
        elsif !params[:employee].blank?
            @logs = Log.by_employee(params[:employee]).date_ordered
        elsif params[:contact_id]
            @logs = Log.by_contact(params[:contact_id]).date_ordered
        elsif !params[:contact].blank?
            @logs = Log.by_contact(params[:contact]).date_ordered
        else
            @logs = Log.all.date_ordered
        end

        



        #if params[:contact_id] && @contact = Contact.find_by(id: params[:contact_id])
        #    @logs = @contact.logs.date_ordered
        #elsif params[:employee_id]
        #    @logs = Log.by_employee(params[:employee_id])
        ##elsif !params[:employee].blank? && params[:employee_id] 
        #    #@logs = Log.by_employee(params[:employee]) 
        #else
        #    @logs = Log.all.date_ordered
        #    #maybe need error message
        #end
    
        # @employees = Employee.all
        # if !params[:employee].blank?
        #     @logs = Log.by_employee(params[:employee])
        # else 
        #     @logs = Log.all
        # end
    end 

    def new
        if params[:contact_id] && @contact = Contact.find_by(id: params[:contact_id])
            @log = @contact.logs.build
        else
            @log = Log.new
        end 

        #@log = Log.new
        #@contacts = Contact.all
        
    end 

    def create
        @log = current_employee.logs.build(log_params)
        #binding.pry
        if @log.save
            redirect_to log_path(@log)
        else
            render new_log_path
        end 
    end 

    def show
        redirect_to logs_path if !@log
        #add flash
    end 

    def edit
        redirect_to logs_path if !@log || @log.employee != current_employee
        #add flash message for this log doesnt exist 
    end 

    def update
        redirect_to logs_path if !@log
        if @log.update(log_params)
            redirect_to log_path(@log)
        else
            render :edit
        end 
    end 

    def destroy
        @log.destroy
        redirect_to logs_path
    end



    private

    def set_log_by_id
        @log = Log.find_by(id: params[:id])
    end 

    def set_all_contacts
        @contacts = Contact.all
    end 


    def log_params
        params.require(:log).permit(:communication_type, :date, :start_time, :answered, :log_notes, :contact_id)
    end 

end
