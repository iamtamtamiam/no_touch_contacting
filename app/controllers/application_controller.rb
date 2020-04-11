class ApplicationController < ActionController::Base

    helper_method :current_employee, :logged_in?

private

    def current_employee
        @current_employee ||= Employee.find_by_id(session[:employee_id]) if session[:employee_id]    end 

    def logged_in?
        !!session[:employee_id]
    end 

    def redirect_if_not_logged_in
        redirect_to root_path if !logged_in?
    end 
end
