module Contexts
  module JobContexts
    # Context for jobs (assumes contexts for others exist)
    def create_jobs
      @job1 = FactoryBot.create(:job) 
      @job2 = FactoryBot.create(:job, name: "Marketing Executive", description: "this is a test", active: true)
      @job3 = FactoryBot.create(:job, name: "Finance Executive", description: "this is a test", active: false)
      @job4 = FactoryBot.create(:job, name: "Cleaner", description: "this is a test", active: true)
    end
    
    def remove_jobs
      @job1.destroy
      @job2.destroy
      @job3.destroy
      @job4.destroy
    end
  end
end