class SessionsController < ApplicationController

    def create
        @employee = Employee.find_by(username: params[:employee][:username])
        if @employee && @employee.authenticate(params[:employee][:password])
            
            session[:employee_id] = @employee.id
            redirect_to employee_path(@employee)
        else
            #set flash message for invalid username/password
            redirect_to login_path #why not render?
        end 

    end 

    def destroy
        session.destroy
        redirect_to root_path
    end 

end 