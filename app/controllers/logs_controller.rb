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





    private

    def log_params
        params.require(:log).permit(:communication_type, :date, :start_time, :answered, :log_notes, :contact_id)
    end 

end
