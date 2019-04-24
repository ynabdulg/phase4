require 'test_helper'

class ShiftJobControllerTest < ActionDispatch::IntegrationTest
  setup do
    create_contexts
  end

  test "should get index" do
    get shift_jobs_url
    assert_response :success
  end

  test "should get new" do
    get new_shift_job_url
    assert_response :success
  end

  test "should create shift_job" do
    assert_difference('ShiftJob.count') do
       @shift_job2 = FactoryBot.create(:shift_job, shift: @shift2, job: @job4) 
    post shift_jobs_url, params: { shift_job: { shift_id: @shift_job2.shift_id, job_id: @shift_job2.job_id } }
    end
  end

  test "should show shift_job" do
    get shift_job_url(@shift_job1)
    assert_response :success
  end

  test "should get edit" do
    get edit_shift_job_url(@shift_job1)
    assert_response :success
  end

  test "should update shift_job" do
    patch shift_job_url(@shift_job2), params: { shift_job: { shift_id: @shift4.id, job_id: @shift_job2.job_id } }
    assert_redirected_to shift_job_url(@shift_job2)
  end

  test "should destroy shift_job" do
    assert_difference('ShiftJob.count', -1) do
      delete shift_job_url(@shift_job1)
    end

    assert_redirected_to shift_jobs_url
  end
end
