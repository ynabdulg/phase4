class ShiftJob < ApplicationRecord
    # Relationships
    belongs_to :shift
    belongs_to :job
    
    # Validations
    # make sure required fields are present
    validates_presence_of :shift_id, :job_id
end
