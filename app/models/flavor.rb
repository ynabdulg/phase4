class Flavor < ApplicationRecord
    
    # Callbacks
    before_destroy :before_delete?
    after_rollback :deactivate
    
    # Relationships
    has_many :store_flavors
    has_many :stores, through: :store_flavors
    
    # Validations
    # make sure required fields are present
    validates_presence_of :name
    
    #scopes
    scope :active,       -> { where(active: true) }
    scope :inactive,     -> { where(active: false) }
    scope :alphabetical, -> { order(:name) }

    
    #callbacks
    private
    def before_delete?
        false
    end


    def deactivate
        self.update_attribute(:active, false)
    end

  
end
