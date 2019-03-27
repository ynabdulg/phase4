class StoresController < ApplicationController
    before_action :set_store, only: [:show, :edit, :update, :destroy]
    
    def index
        @stores = store.alphabetical.paginate(:page => params[:page]).per_page(10)
    end
    
    def showInactive
        @stores = store.inactive.alphabetical
    end
    
    def showActive
        @stores = store.active.alphabetical
    end
    
    def new     
        @store = store.new   
    end
    
    def show
    end
    
    def edit
    end
    
    def create    
        @store = store.new(store_params)     
        if @store.save       
            redirect_to store_path(@store), notice: "#{@store.name} was added to the system."     
        else       
            render action: 'new'     
        end   
    end 
 
    def update     
        if @store.update(store_params)       
            redirect_to store_path(@store), notice: "#{@store.name} was revised in the system."     
        else       
            render action: 'edit'     
        end   
    end
    
    def destroy     
        @store.destroy     
        redirect_to stores_url   
    end 
    
    private   
    def store_params     
        params.require(:store).permit(:name, :street, :zip)  
    end
    
    def set_store 
        @store = store.find(params[:id]) 
    end 
end


