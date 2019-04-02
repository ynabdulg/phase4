require 'test_helper'

class EmployeeControllerTest < ActionDispatch::IntegrationTest
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
    get employees_url
    assert_response :success
  end
  
  test "should get active" do
    get active_employees_path
    assert_response :success
  end
  
  test "should get inactive" do
    get inactive_employees_path
    assert_response :success
  end
  
  test "should get younger" do
    get younger_employees_path
    assert_response :success
  end
  
  test "should get older" do
    get older_employees_path
    assert_response :success
  end

test "should get regulars" do
    get regulars_employees_path
    assert_response :success
  end
  
  test "should get managers" do
    get managers_employees_path
    assert_response :success
  end
  test "should get admins" do
    get admins_employees_path
    assert_response :success
  end
  test "should get new" do
    get new_employee_url
    assert_response :success
  end

  test "should create employee" do
    assert_difference('Employee.count') do
      post employees_url, params: { employee: { first_name: @cindy.first_name, last_name: @cindy.last_name, sssn: @cindy.ssn, date_of_birth: @cindy.date_of_birth, phone: @cindy.phone, role: @cindy.role, active: @cindy.active} }
    end

    assert_redirected_to employee_url(@cindy)
  end

  test "should show employee" do
    get employee_url(@cindy)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_url(@cindy)
    assert_response :success
  end

  test "should update employee" do
    patch employee_url(@cindy), params: { employee: { first_name: @cindy.first_name, last_name: @cindy.last_name, sssn: @cindy.ssn, date_of_birth: @cindy.date_of_birth, phone: @cindy.phone, role: @cindy.role, active: @cindy.active} }
    assert_redirected_to employee_url(@cindy)
  end

  test "should destroy employee" do
    assert_difference('Employee.count', -1) do
      delete employee_url(@assign_ben)
    end

    assert_redirected_to employees_url
  end
end