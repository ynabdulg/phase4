class AssignmentsController < ApplicationController
    before_action :set_assignment, only: [:show, :edit, :update, :destroy]
    
    def index
        @assignments = Assignment.all.paginate(:page => params[:page]).per_page(10)
    end
    
    def showInactive
        @assignments = Assignment.inactive.alphabetical
    end
    
    def showActive
        @assignments = Assignment.active.alphabetical
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
            redirect_to assignment_path(@assignment), notice: "assignment number #{@assignment.id} was added to the system."     
        else       
            render action: 'new'     
        end   
    end 
 
    def update     
        if @assignment.update(assignment_params)       
            redirect_to assignment_path(@assignment), notice: "assignment number #{@assignment.id} was revised in the system."     
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
