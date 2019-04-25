class Shift < ApplicationRecord
    
    #callbacks
    before_create :set_end_time
    
    # Relationships
    belongs_to :assignment
    has_one :store, through: :assignment
    has_one :employee, through: :assignment
    has_many :shift_jobs
    has_many :jobs, through: :shift_jobs
    
    # Validations
    # make sure required fields are present
    validates_presence_of :assignment_id, :date, :start_time
    #make sure date is set either today or in the future for new shifts
    validates_date :date, on_or_after: lambda { Date.current }, on_or_after_message: "Date must be either today or sometime in the future"
    #validate start time
    validates_time :start_time
    #make sure end time is after start time
    validates_time :end_time, after: :start_time, allow_blank: true, after_message: "End time must be after start time"
    #make sure shift can only be added to current assignments
    validate :only_current_assignment
    
    #scopes for shift
    scope :completed, -> { joins(:shift_jobs).group(:shift_id) }
    scope :incomplete, -> { joins("LEFT JOIN shift_jobs ON shifts.id = shift_jobs.shift_id").where('shift_jobs.job_id IS NULL') }
    scope :for_employee, ->(employee_id) { joins(:assignment, :employee).where("assignments.employee_id = ?", employee_id) }
    scope :for_store, ->(store_id) { joins(:assignment, :store).where("assignments.store_id = ?", store_id) }
    scope :past, -> { where('date < ?', Date.current) }
    scope :upcoming, -> { where('date >= ?', Date.current) }
    scope :for_next_days, ->(x) { where('date BETWEEN ? AND ?', Date.today, x.days.from_now.to_date) }
    scope :for_past_days, ->(x) { where('date BETWEEN ? AND ?', x.days.ago.to_date, 1.day.ago.to_date) }
    scope :chronological, -> { order(:date, :start_time) }
    scope :by_store, -> { joins(:assignment, :store).order('stores.name') }
    scope :by_employee, -> { joins(:assignment, :employee).order('employees.last_name, employees.first_name') }
    
    
    #methods for shift
    def completed?
        self.shift_jobs.count > 0
    end
    
    def start_now
        self.update_attribute(:start_time, Time.current)
    end


    def end_now
        self.update_attribute(:end_time, Time.current)
    end
    
    #can only delete if shift scheduled today or in future
    
    
    #callbacks 
    private
    #custom validation method
    def only_current_assignment
        unless self.assignment.nil? || self.assignment.end_date.nil?
            errors.add(:assignment_id, "is a past assignment at the creamery, please choose a current assignment")
        end
    end
    
    #set end time to 3 hours after start time
    def set_end_time
        self.end_time = self.start_time + (10800) #3*60*60
    end
end
