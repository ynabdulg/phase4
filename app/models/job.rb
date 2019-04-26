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
    def worked?
        self.shift_jobs.empty?
    end 
    
    def before_delete? #check if job has been worked by an employee
        throw :abort if not worked?
    end

    def deactivate
        self.update_attribute(:active, false)
    end

  
end
