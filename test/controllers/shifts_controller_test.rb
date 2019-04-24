require 'test_helper'

class ShiftControllerTest < ActionDispatch::IntegrationTest
  setup do
    create_contexts  #create contexts all 
  end

  test "should get index" do
    get shifts_url
    assert_response :success
  end

  test "should get new" do
    get new_shift_url
    assert_response :success
  end

  test "should create shift" do
    assert_difference('Shift.count') do
       @shift5 = FactoryBot.create(:shift, assignment: @promote_ben, date: 2.days.from_now.to_date, start_time: Time.current, notes: "this is a test hiiiiii")
      post shifts_url, params: { shift: { assignment_id: @shift5.assignment_id, date: @shift5.date, end_time: @shift5.end_time, notes: @shift5.notes, start_time: @shift5.start_time } }
    end
  end

  test "should show shift" do
    get shift_url(@shift4)
    assert_response :success
  end

  test "should get edit" do
    get edit_shift_url(@shift4)
    assert_response :success
  end

  test "should update shift" do
    patch shift_url(@shift4), params: { shift: { assignment_id: @shift4.assignment_id, date: @shift4.date, end_time: @shift4.end_time, notes: @shift4.notes, start_time: @shift4.start_time } }
    assert_redirected_to shift_url(@shift4)
  end

  test "should destroy shift" do
    assert_difference('Shift.count', -1) do
      delete shift_url(@shift4)
    end

    assert_redirected_to shifts_url
  end
end
