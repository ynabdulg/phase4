class EmployeesController < ApplicationController
    before_action :set_employee, only: [:show, :edit, :update, :destroy]
    
    def index
        @employees = Employee.alphabetical.paginate(:page => params[:page]).per_page(10)
    end
    
    def showInactive
        @employees = Employee.inactive.alphabetical
    end
    
    def showActive
        @employees = Employee.active.alphabetical
    end
    
    def new     
        @employee = Employee.new   
    end
    
    def show
    end
    
    def edit
    end
    
    def create    
        @employee = Employee.new(employee_params)     
        if @employee.save       
            redirect_to employee_path(@employee), notice: "#{@employee.name} was added to the system."     
        else       
            render action: 'new'     
        end   
    end 
 
    def update     
        if @employee.update(employee_params)       
            redirect_to employee_path(@employee), notice: "#{@employee.name} was revised in the system."     
        else       
            render action: 'edit'     
        end   
    end
    
    def destroy     
        @employee.destroy     
        redirect_to employees_url   
    end 
    
    private   
    def employee_params     
        params.require(:employee).permit(:name, :street, :city, :state, :zip, :phone, :active, :longitude, :latitude) 
    end
    
    def set_employee 
        @employee = Employee.find(params[:id]) 
    end 
end
