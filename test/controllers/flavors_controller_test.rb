require 'test_helper'

class FlavorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    create_contexts
  end

  test "should get index" do
    get flavors_url
    assert_response :success
  end

  test "should get new" do
    get new_flavor_url
    assert_response :success
  end

  test "should create flavor" do
    assert_difference('Flavor.count') do
      @flavor5 = FactoryBot.create(:flavor, name: "Mix Berry", active: true)
      post flavors_url, params: { flavor: { active: @flavor5.active, name: @flavor5.name} }
    end
  end

  test "should show flavor" do
    get flavor_url(@flavor2)
    assert_response :success
  end

  test "should get edit" do
    get edit_flavor_url(@flavor2)
    assert_response :success
  end

  test "should update flavor" do
    patch flavor_url(@flavor2), params: { flavor: { active: @flavor2.active, name: "mango" } }
    assert_redirected_to flavor_url(@flavor2)
  end

  test "should destroy flavor" do
    assert_difference('Flavor.count', -1) do
      delete flavor_url(@flavor2)
    end

    assert_redirected_to flavors_url
  end
end
