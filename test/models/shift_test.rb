require 'test_helper'

class ShiftTest < ActiveSupport::TestCase
  # Test relationships
  should have_one(:store).through(:assignment)
  should have_one(:employee).through(:assignment)
  should belong_to(:assignment)
  should have_many(:shift_jobs)
  should have_many(:jobs).through(:shift_jobs)
  
  # # Test basic validations
  should validate_presence_of(:assignment_id)
  should validate_presence_of(:date)  
  should validate_presence_of(:start_time)
  
  # test date
  should allow_value(17.days.from_now.to_date).for(:date)
  should allow_value(1.month.from_now.to_date).for(:date)
  should allow_value(1.year.from_now.to_date).for(:date)
  should_not allow_value(13.years.ago).for(:date)
  should_not allow_value("bad").for(:date)
  should_not allow_value(nil).for(:date)
  
  # test start-time
  should allow_value(Time.now).for(:start_time)
  should allow_value(1.hour.from_now).for(:start_time)
  should allow_value(20.hours.from_now).for(:start_time)
  should_not allow_value(15665).for(:start_time)
  should_not allow_value("bad").for(:start_time)
  should_not allow_value(nil).for(:start_time)
  
  # test end-time
  should_not allow_value("bad").for(:end_time)
  should_not allow_value(15665).for(:end_time)
  
  
  #scopes
  context "Creating a context for shifts" do
    # create the objects I want with factories
  setup do 
      create_contexts
    end

    teardown do
      destroy_contexts
    end

    
    # test the scope 'completed'
    should "have a scope for completed shifts" do
      assert_equal 3, Shift.completed.to_a.size
    end

    # test the scope 'incomplete'
    should "have a scope for incomplete shifts" do
      assert_equal 1, Shift.incomplete.to_a.size
    end
    
    # test the scope 'for_employee'
    should "have a scope called for_employee" do
      assert_equal 2, Shift.for_employee(@ben.id).size
      assert_equal 1, Shift.for_employee(@cindy.id).size
      assert_equal 1, Shift.for_employee(@kathryn.id).size
      assert_equal 0, Shift.for_employee(@alex.id).size
    end

    # test the scope 'for_store'
    should "have a scope called for_store" do
      assert_equal 3, Shift.for_store(@cmu.id).size
      assert_equal 1, Shift.for_store(@oakland.id).size
    end
    
    # test the scope 'past'
    should "have a scope for past shifts" do
      assert_equal 0, Shift.past.size
    end

    # test the scope 'upcoming'
    should "have a scope for upcoming shifts" do
      assert_equal 4, Shift.upcoming.size
    end

    # test the scope 'for_next_days'
    should "have a scope called for_next_days" do
      assert_equal 1, Shift.for_next_days(0).size
      assert_equal 2, Shift.for_next_days(1).size
      assert_equal 3, Shift.for_next_days(2).size
      assert_equal 4, Shift.for_next_days(3).size
    end

    # test the scope 'for_past_days'
    should "have a scope called for_past_days" do
      assert_equal 0, Shift.for_past_days(1).size
      assert_equal 0, Shift.for_past_days(2).size
      assert_equal 0, Shift.for_past_days(3).size
    end
    
    # test the scope 'chronological'
    should "have a scope to order chronologically" do
      assert_equal [@shift1, @shift2, @shift3, @shift4], Shift.chronological.map{|s| s}
      assert_equal 4, Shift.chronological.size
    end

    # test the scope 'by_store'
    should "have a scope to order by store name" do
      assert_equal ["CMU", "CMU", "CMU", "Oakland"], Shift.by_store.map{|s| s.store.name}
      assert_equal 4, Shift.by_store.size
    end

    # test the scope 'by_employee'
    should "have a scope to order by employee name" do
      assert_equal ["Crawford, Cindy", "Janeway, Kathryn", "Sisko, Ben", "Sisko, Ben"], Shift.by_employee.map{|s| s.employee.name}
      assert_equal 4, Shift.by_employee.size
    end



    #methods
    # test the class method 'complete' 
    should "have a class method that returns true if there are any jobs associated with that particular shift" do
      assert_equal true, @shift1.completed?
      assert_equal false, @shift3.completed?
    end
    
    # test start_now method
    should "have start_now method that updates database to current time" do 
      @shift1.start_now
      assert_in_delta  @shift1.start_time, Time.zone.now, 1.second
      #assert_equal Time.current, @shift1.start_time
    end


    # test end_now method
    should "have end_now method that updates database to current time" do 
      @shift1.end_now
      assert_in_delta @shift1.end_time, Time.zone.now, 1.second
      #assert_equal Time.current, @shift1.start_time
    end
    
    #test only_current_assignment
    should "not allow shift to be created if assignment not active" do
      @a = FactoryBot.build(:shift, assignment: @assignment10, date: 1.days.from_now.to_date, start_time: Time.current, notes: "this is a test")
        assert !@a.valid?
    end
end
end
