class StoresController < ApplicationController
    before_action :set_store, only: [:show, :edit, :update, :destroy]
    
    def index
        @stores = Store.alphabetical.paginate(:page => params[:page]).per_page(10)
    end
    
    def showInactive
        @stores = Store.inactive.alphabetical
    end
    
    def showActive
        @stores = Store.active.alphabetical
    end
    
    def new     
        @store = Store.new   
    end
    
    def show
    end
    
    def edit
    end
    
    def create    
        @store = Store.new(store_params)     
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
        params.require(:store).permit(:name, :street, :city, :state, :zip, :phone, :active, :longitude, :latitude) 
    end
    
    def set_store 
        @store = Store.find(params[:id]) 
    end 
end


