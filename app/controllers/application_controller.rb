class ApplicationController < ActionController::Base

    helper_method :current_employee, :logged_in?

private

    def current_employee
        @current_employee ||= Employee.find_by_id(session[:employee_id]) if session[:employee_id]
    end 

    def logged_in?
        !!session[:employee_id]
    end 

    def redirect_if_not_logged_in
        #redirect_to root_path if !logged_in?
        if !logged_in?
            flash[:message] = "You are not logged in."
            redirect_to root_path
        end 
    end 

    def redirect_if_logged_in
        if logged_in?
            flash[:message] = "You are already logged in. If you wish to log out, click 'Logout'."
            redirect_to employee_path(current_employee)
        end
    end 
end
