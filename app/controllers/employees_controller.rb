class EmployeesController < ApplicationController

    layout 'layouts/user'

    def new
        redirect_if_logged_in
        @employee = Employee.new
        render layout: 'welcome'
        
    end 

    def create
       @employee = Employee.new(employee_params)
       if @employee.save
            session[:employee_id] = @employee.id
            redirect_to employee_path(@employee)
       else
            render :new
       end
    end 

    def show
        if logged_in?
            @employee = Employee.find_by(id: params[:id])
            if @employee != current_employee
                flash[:message] = "You are not authorized to view another employee's info. Back to your homepage."
                redirect_to employee_path(current_employee)
            end
        else redirect_if_not_logged_in
        end     
    end 

    private

    def employee_params
        params.require(:employee).permit(:username, :password, :email, :name, :job_title)
    end 

end
