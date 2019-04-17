class StoreFlavor < ApplicationRecord
    # Relationships
    belongs_to :store
    belongs_to :flavor
    
    # Validations
    # make sure required fields are present
    validates_presence_of :store_id, :flavor_id
end
