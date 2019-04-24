require 'test_helper'

class StoreFlavorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    create_contexts
  end

  test "should get index" do
    get store_flavors_url
    assert_response :success
  end

  test "should get new" do
    get new_store_flavor_url
    assert_response :success
  end

  test "should create store_flavor" do
    assert_difference('StoreFlavor.count') do
      @store_flavor5 = FactoryBot.create(:store_flavor, store: @cmu, flavor: @flavor3) 
      post store_flavors_url, params: { store_flavor: { flavor_id: @store_flavor5.flavor_id, store_id: @store_flavor5.store_id } }
    end

    assert_redirected_to store_flavor_url(StoreFlavor.last)
  end

  test "should show store_flavor" do
    get store_flavor_url(@store_flavor3)
    assert_response :success
  end

  test "should get edit" do
    get edit_store_flavor_url(@store_flavor3)
    assert_response :success
  end

  test "should update store_flavor" do
    patch store_flavor_url(@store_flavor3), params: { store_flavor: { flavor_id: @store_flavor3.flavor_id, store_id: @store_flavor3.store_id } }
    assert_redirected_to store_flavor_url(@store_flavor3)
  end

  test "should destroy store_flavor" do
    assert_difference('StoreFlavor.count', -1) do
      delete store_flavor_url(@store_flavor3)
    end

    assert_redirected_to store_flavors_url
  end
end
