class Shift < ApplicationRecord
    
    # Validations
    # make sure required fields are present
    validates_presence_of :assignment_id, :date, :start_time
    #make sure date is set either today or in the future for new shifts
    validates_date :date, on_or_after: lambda { Date.current }, on_or_after_message: "Date must be either today or sometime in the future"
end
