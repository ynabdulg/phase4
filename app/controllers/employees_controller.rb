class EmployeesController < ApplicationController
    before_action :set_employee, only: [:show, :edit, :update, :destroy]
    
    def index
        @employees = Employee.alphabetical.paginate(:page => params[:page]).per_page(10)
    end
    
    def inactive
        @employees = Employee.inactive.alphabetical.paginate(:page => params[:page]).per_page(10)
    end
    
    def active
        @employees = Employee.active.alphabetical.paginate(:page => params[:page]).per_page(10)
    end
    
    def younger
        @employees = Employee.younger_than_18.alphabetical.paginate(:page => params[:page]).per_page(10)
    end 
    
    def older
        @employees = Employee.is_18_or_older.alphabetical.paginate(:page => params[:page]).per_page(10)
    end
  
    def regulars
        @employees = Employee.regulars.alphabetical.paginate(:page => params[:page]).per_page(10)
    end 
    
    def managers
        @employees = Employee.managers.alphabetical.paginate(:page => params[:page]).per_page(10)
    end 
    
    def admins
        @employees = Employee.admins.alphabetical.paginate(:page => params[:page]).per_page(10)
    end
    
    def new     
        @employee = Employee.new
        @employee.build_user
    end
    
    def show
    end
    
    def edit
    end
    
    def create    
        @employee = Employee.new(employee_params) 
        
        puts "inside create"
        
        if @employee.save
            
            puts "inside save"
            
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
        if User != nil
            user = User.find_by_employee_id(@employee.id)
            if user != nil
                user.destroy
            end
        end
        @employee.destroy
        redirect_to employees_url   
    end 
    
    private   
    def employee_params     
        params.require(:employee).permit(:first_name, :last_name, :ssn, :date_of_birth, :phone, :role, :active, user_attributes: [:id, :email, :password]) 
    end
    
    def set_employee 
        @employee = Employee.find(params[:id]) 
    end 
end

