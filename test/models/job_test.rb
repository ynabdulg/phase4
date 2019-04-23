require 'test_helper'

class JobTest < ActiveSupport::TestCase
  # Test relationships
  should have_many(:shift_jobs)
  should have_many(:shifts).through(:shift_jobs)


  # Test validations
  should validate_presence_of(:name)


  #scopes
  # create the objects I want with factories
  context "Creating a context for jobs" do

    setup do 
      create_jobs
    end

    
    teardown do
      remove_jobs
    end

  
    # test the scope 'alphabetical'
    should "scope that return jobs in alphabetical order" do
      assert_equal ["Cleaner", "Finance Executive", "Ice Cream Server", "Marketing Executive"], Job.alphabetical.map{|j| j.name}
      assert_equal 4, Job.alphabetical.size
    end

    

    # test the scope 'active'
    should "scope that return active jobs" do
      assert_equal ["Cleaner", "Ice Cream Server", "Marketing Executive"], Job.active.alphabetical.map{|j| j.name}
      assert_equal 3, Job.active.size
    end

    

    # test the scope 'inactive'
    should "scope that return inactive jobs" do
      assert_equal ["Finance Executive"], Job.inactive.alphabetical.map{|j| j.name}
      assert_equal 1, Job.inactive.size
    end
    
    #test callback
    should "check that job can only be deleted if not worked by employee" do
      assert_equal false, @job1.destroyed? #job 1 can't be deleted because it has a shift worked by an employee
    end
end
end
