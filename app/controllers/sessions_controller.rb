class SessionsController < ApplicationController
    layout 'layouts/welcome'

    def new
        redirect_if_logged_in
    end 

    def create
        @employee = Employee.find_by(username: params[:employee][:username])
        if @employee && @employee.authenticate(params[:employee][:password])
            
            session[:employee_id] = @employee.id
            redirect_to employee_path(@employee)
        else
            flash[:message] = "Incorrect Username/Password. Please Try Again."
            redirect_to login_path 
        end 

    end 

    def google
        @employee = Employee.find_or_create_by(email: auth["info"]["email"]) do |employee|
           employee.name = auth["info"]["name"]
           employee.password = SecureRandom.hex
           employee.username = auth.uid
           
        end
        #binding.pry
        if @employee.save
            session[:employee_id] = @employee.id
            redirect_to employee_path(@employee)
        else
            redirect_to root_path
        end 

    end 


    def destroy
        session.destroy
        redirect_to root_path
    end 

    private

    def auth
        request.env['omniauth.auth']
    end

end 