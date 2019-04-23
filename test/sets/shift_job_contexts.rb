module Contexts
  module ShiftJobContexts
    # Context for shift_jobs (assumes contexts for others exist)
    def create_shift_jobs
      @shift_job1 = FactoryBot.create(:shift_jobs, shift: @shift1, job: @job1) 
      @shift_job2 = FactoryBot.create(:shift_jobs, shift: @shift2, job: @job2) 
      @shift_job3 = FactoryBot.create(:shift_jobs, shift: @shift1, job: @job3)  
      @shift_job4 = FactoryBot.create(:shift_jobs, shift: @shift4, job: @job4) 
    end
    
    def remove_shift_jobs
      @shift_job1.destroy
      @shift_job2.destroy
      @shift_job3.destroy
      @shift_job4.destroy
    end
  end
end