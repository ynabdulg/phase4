class Job < ApplicationRecord
    
    #callbacks
    before_destroy :before_delete?
    after_rollback :deactivate
    
    # Relationships
    has_many :shift_jobs
    has_many :shifts, through: :shift_jobs
    
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
        self.shift_jobs.empty?
    end

    def change_to_inactive
        self.update_attribute(:active, false)
    end

    def deactivate
        change_to_inactive if !self.shift_jobs.nil? && self.before_delete? == false
        self.shift_jobs = nil
    end
  
end
