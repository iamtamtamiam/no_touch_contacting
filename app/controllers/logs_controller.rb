class LogsController < ApplicationController
    before_action :redirect_if_not_logged_in


    def index
        if params[:contact_id] && @contact = Contact.find_by(id: params[:contact_id])
            @logs = @contact.logs.date_ordered
        elsif params[:employee_id] && @employee = Employee.find_by(id: params[:employee_id])
            @logs = @employee.logs.date_ordered
        else
            @logs = Log.all.date_ordered
            #maybe need error message
        end 
    end 

    def new
        @contacts = Contact.all
        if params[:contact_id] && @contact = Contact.find_by(id: params[:contact_id])
            @log = @contact.logs.build
        else
            @log = Log.new
        end 

        #@log = Log.new
        #@contacts = Contact.all
        
    end 

    def create
        @contacts = Contact.all
        @log = current_employee.logs.build(log_params)
        #binding.pry
        if @log.save
            redirect_to log_path(@log)
        else
            render new_log_path
        end 
    end 

    def show
        set_log_by_id
    end 

    def edit
        set_log_by_id
        @contacts = Contact.all
        redirect_to logs_path if !@log || @log.employee != current_employee
        #add flash message for this log doesnt exist
        #only user who created log can edit it. 
        # maybe add last upadated by? on the show page
    end 

    def update
        set_log_by_id
        redirect_to logs_path if !@log
        if @log.update(log_params)
            redirect_to log_path(@log)
        else
            render :edit
            #add flash message
        end 
    end 



    private

    def set_log_by_id
        @log = Log.find_by(id: params[:id])
    end 


    def log_params
        params.require(:log).permit(:communication_type, :date, :start_time, :answered, :log_notes, :contact_id)
    end 

end
