class LogsController < ApplicationController

    def index
        @logs = Log.all
    end 

    def new
        @log = Log.new
        @contacts = Contact.all
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
        @log = Log.find_by(id: params[:id])
    end 

    def edit
        @log = Log.find_by(id: params[:id])
        @contacts = Contact.all
        redirect_to logs_path if !@log || @log.employee != current_employee
        #add flash message for this log doesnt exist
        #only user who created log can edit it. 
        # maybe add last upadated by? on the show page
    end 

    def update
        @log = Log.find_by(id: params[:id])
        redirect_to logs_path if !@log
        if @log.update(log_params)
            redirect_to log_path(@log)
        else
            render :edit
            #add flash message
        end 
    end 






    private

    def log_params
        params.require(:log).permit(:communication_type, :date, :start_time, :answered, :log_notes, :contact_id)
    end 

end
