require 'test_helper'

class JobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    create_contexts
  end

  test "should get index" do
    get jobs_url
    assert_response :success
  end

  test "should get new" do
    get new_job_url
    assert_response :success
  end

  test "should create job" do
    assert_difference('Job.count') do
      # @job5 = FactoryBot.create(:job, active: true, description: "this is a test", name: "Ice cream scooper")
      post jobs_url, params: { job: { active: true, description: "this is a test", name: "Ice cream scooper" } }
    end
  end

  test "should show job" do
    get job_url(@job3)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_url(@job3)
    assert_response :success
  end

  test "should update job" do
    patch job_url(@job2), params: { job: { active: @job2.active, description: @job2.description, name: @job3.name } }
    assert_redirected_to job_url(@job2)
  end

  test "should destroy job" do
    assert_difference('Job.count', -1) do
      delete job_url(@job2)
    end

    assert_redirected_to jobs_url
  end
end
