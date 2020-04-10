class SessionsController < ApplicationController

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.find_by(username: params[employee][:username])
        if @employee && @employee.authenticate(params[:employee][:password])
            session[:id] = @employee.id
            redirect_to employee_path(@employee)
        else
            #set flash message for invalid username/password
            redirect_to login_path #why not render?
        end 

    end 

    def destroy

    end 

end 