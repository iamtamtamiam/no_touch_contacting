class EmployeesController < ApplicationController

    def new
        @employee = Employee.new
    end 

    def create
       @employee = Employee.new(employee_params)
       if @employee.save
            session[:employee_id] = @employee.id
            redirect_to employee_path(@employee)
       else
            render sign_up
       end
    end 

    def show
        @employee = Employee.find_by(id: params[:id])
    end 


    private

    def employee_params
        params.require(:employee).permit(:username, :password, :name, :job_title)
    end 

end
