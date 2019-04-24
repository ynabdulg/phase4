module Contexts
  module StoreFlavorContexts
    # Context for store_flavors (assumes contexts for others exist)
    def create_store_flavors
      @store_flavor1 = FactoryBot.create(:store_flavor, store: @cmu, flavor: @flavor1) 
      @store_flavor2 = FactoryBot.create(:store_flavor, store: @cmu, flavor: @flavor2) 
      @store_flavor3 = FactoryBot.create(:store_flavor, store: @hazelwood, flavor: @flavor3) 
      @store_flavor4 = FactoryBot.create(:store_flavor, store: @oakland, flavor: @flavor4) 
    end
    
    def remove_store_flavors
      @store_flavor1.destroy
      @store_flavor2.destroy
      @store_flavor3.destroy
      @store_flavor4.destroy
    end
  end
end