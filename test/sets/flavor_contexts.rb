module Contexts
  module FlavorContexts
    # Context for flavors (assumes contexts for others exist)
    def create_flavors
      @flavor1 = FactoryBot.create(:flavor) 
      @flavor2 = FactoryBot.create(:flavor, name: "Very Berry", active: true)
      @flavor3 = FactoryBot.create(:flavor, name: "Vanilla", active: false)
      @flavor4 = FactoryBot.create(:flavor, name: "Cookies and cream", active: true)
    end
    
    def remove_flavors
      @flavor1.destroy
      @flavor2.destroy
      @flavor3.destroy
      @flavor4.destroy
    end
  end
end