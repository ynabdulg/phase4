class AssignmentsController < ApplicationController
    before_action :set_assignment, only: [:show, :edit, :update, :destroy]
    
    def index
        @assignments = Assignment.all.chronological.paginate(:page => params[:page]).per_page(10)
    end
    
    def past
        @assignments = Assignment.past.chronological.paginate(:page => params[:page]).per_page(10)
    end
    
    def current
        @assignments = Assignment.current.chronological.paginate(:page => params[:page]).per_page(10)
    end
    
    def by_employee
        @assignments = Assignment.by_employee.paginate(:page => params[:page]).per_page(10)
    end
    
    def by_store
        @assignments = Assignment.by_store.paginate(:page => params[:page]).per_page(10)
    end
    
    def for_employees
        @assignments = Assignment.for_role("employee").paginate(:page => params[:page]).per_page(10)
    end
    
    def for_managers
        @assignments = Assignment.for_role("manager").paginate(:page => params[:page]).per_page(10)
    end
    
    def for_admins
        @assignments = Assignment.for_role("admin").paginate(:page => params[:page]).per_page(10)
    end
    
    def for_one
        @assignments = Assignment.for_pay_level(1).paginate(:page => params[:page]).per_page(10)
    end
    
    def for_two
        @assignments = Assignment.for_pay_level(2).paginate(:page => params[:page]).per_page(10)
    end
    
    def for_three
        @assignments = Assignment.for_pay_level(3).paginate(:page => params[:page]).per_page(10)
    end
    
    def for_four
        @assignments = Assignment.for_pay_level(4).paginate(:page => params[:page]).per_page(10)
    end
    
    def for_five
        @assignments = Assignment.for_pay_level(5).paginate(:page => params[:page]).per_page(10)
    end
    
    def for_six
        @assignments = Assignment.for_pay_level(6).paginate(:page => params[:page]).per_page(10)
    end
    
    def new     
        @assignment = Assignment.new   
    end
    
    def show
    end
    
    def edit
    end
    
    def create    
        @assignment = Assignment.new(assignment_params)     
        if @assignment.save       
            redirect_to assignment_path(@assignment), notice: "#{Employee.find(@assignment.employee_id).name} is assigned to #{Store.find(@assignment.store_id).name}"    
        else       
            render action: 'new'     
        end   
    end 
 
    def update     
        if @assignment.update(assignment_params)       
            redirect_to assignment_path(@assignment), notice: "#{Employee.find(@assignment.employee_id).name}'s assignment to #{Store.find(@assignment.store_id).name}  is updated"     
        else       
            render action: 'edit'     
        end   
    end
    
    def destroy     
        @assignment.destroy     
        redirect_to assignments_url   
    end 
    
    private   
    def assignment_params     
        params.require(:assignment).permit(:store_id, :employee_id, :start_date, :end_date, :pay_level) 
    end
    
    def set_assignment 
        @assignment = Assignment.find(params[:id]) 
    end 
end
