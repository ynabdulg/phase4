require 'test_helper'

class StoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    create_employees
    create_stores
    create_assignments
  end

  teardown do
    remove_employees
    remove_stores
    remove_assignments
  end

  test "should get index" do
    get stores_url
    assert_response :success
  end
  
  test "should get inactive" do
    get inactive_stores_path
    assert_response :success
  end
  
  test "should get active" do
    get active_stores_path
    assert_response :success
  end

  test "should get new" do
    get new_store_url
    assert_response :success
  end

  test "should create store" do
    assert_difference('Store.count') do
       @oakland1 = FactoryBot.create(:store, name: "Oakland1", phone: "412-268-8241")
    post stores_url, params: { store: { name: @oakland1.name, phone: @oakland1.phone} }
    end
  end

  test "should show store" do
    get store_url(@cmu)
    assert_response :success
  end

  test "should get edit" do
    get edit_store_url(@cmu)
    assert_response :success
  end

  test "should update store" do
    patch store_url(@cmu), params: { store: { active: @cmu.active, city: @cmu.city, latitude: @cmu.latitude, longitude: @cmu.longitude, name: @cmu.name, phone: @cmu.phone, state: @cmu.state, street: @cmu.street, zip: @cmu.zip } }
    assert_redirected_to store_url(@cmu)
  end

  test "should destroy store" do
    assert_difference('Store.count', -1) do
      delete store_url(@oakland)
    end

    assert_redirected_to stores_url
  end
end

