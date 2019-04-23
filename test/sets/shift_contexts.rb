module Contexts
  module ShiftContexts
    # Context for shifts (assumes contexts for others exist)
    def create_shifts
      @shift1 = FactoryBot.create(:shift, assignment: @promote_ben) 
      @shift2 = FactoryBot.create(:shift, assignment: @assign_kathryn, date: 1.days.from_now.to_date, start_time: Time.current, notes: "this is a test")
      @shift3 = FactoryBot.create(:shift, assignment: @promote_ben, date: 2.days.from_now.to_date, start_time: Time.current, notes: "this is a test hiiiiii")
      @shift4 = FactoryBot.create(:shift, assignment: @assign_cindy, date: 3.days.from_now.to_date, start_time: Time.current, notes: "test test test test")
    end
    
    def remove_shifts
      @shift1.destroy
      @shift2.destroy
      @shift3.destroy
      @shift4.destroy
    end
  end
end