require 'test_helper'

class AssignmentsControllerTest < ActionDispatch::IntegrationTest
     setup do
    create_stores
    create_employees
    create_assignments
  end

  teardown do
    remove_stores
    remove_employees
    remove_assignments
  end

  test "should get index" do
    get assignments_url
    assert_response :success
  end
  
  test "should get past" do
    get past_assignments_path
    assert_response :success
  end
  
  test "should get current" do
    get current_assignments_path
    assert_response :success
  end
  
  test "should get by store" do
    get by_store_assignments_path
    assert_response :success
  end
  
  test "should get for employees" do
    get for_employees_assignments_path
    assert_response :success
  end
  
  test "should get for managers" do
    get for_managers_assignments_path
    assert_response :success
  end
  
  test "should get for admins" do
    get for_admins_assignments_path
    assert_response :success
  end
  
  test "should get for one" do
    get for_one_assignments_path
    assert_response :success
  end
  
  test "should get for two" do
    get for_two_assignments_path
    assert_response :success
  end
  
  test "should get for three" do
    get for_three_assignments_path
    assert_response :success
  end
  
  test "should get for four" do
    get for_four_assignments_path
    assert_response :success
  end
  
  test "should get for five" do
    get for_five_assignments_path
    assert_response :success
  end
  
  test "should get for six" do
    get for_six_assignments_path
    assert_response :success
  end
  
  test "should get by employee" do
    get by_employee_assignments_path
    assert_response :success
  end

  test "should get new" do
    get new_assignment_url
    assert_response :success
  end

  test "should create assignment" do
    assert_difference('Assignment.count') do
      @assign = FactoryBot.create(:assignment, employee: @cindy, store: @cmu, start_date: 1.day.ago.to_date, end_date: nil)
      post assignments_url, params: { assignment: { store_id: @assign.store_id, employee_id: @assign.employee_id, start_date: @assign.start_date, end_date: @assign.end_date} }
    end
  end

  test "should show assignment" do
    get assignment_url(@assign_ed)
    assert_response :success
  end

  test "should get edit" do
    get edit_assignment_url(@assign_ed)
    assert_response :success
  end

  test "should update assignment" do
    patch assignment_url(@assign_ed), params: { assignment: { store_id: @assign_ed.store_id, employee_id: @assign_ed.employee_id, start_date: @assign_ed.start_date, end_date: @assign_ed.end_date, pay_level: @assign_ed.pay_level } }
    assert_redirected_to assignment_url(@assign_ed)
  end

  test "should destroy assignment" do
    assert_difference('Assignment.count', -1) do
      delete assignment_url(@assign_ben)
    end

    assert_redirected_to assignments_url
  end
end