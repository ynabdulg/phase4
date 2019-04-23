require 'test_helper'

class FlavorTest < ActiveSupport::TestCase
  # Test relationships
  should have_many(:store_flavors)
  should have_many(:stores).through(:store_flavors)


  # Test validations
  should validate_presence_of(:name)

  #scopes
  # create the objects I want with factories
  context "Creating a context for flavors" do

    setup do 
      create_flavors
    end

    teardown do
      remove_flavors
    end

    
    # test the scope 'alphabetical'
    should "scope that return flavors in alphabetical order" do
      assert_equal ["Cookies and cream", "Mango Madness", "Vanilla", "Very Berry"], Flavor.alphabetical.map{|f| f.name}
      assert_equal 4, Flavor.alphabetical.size
    end

    

    # test the scope 'active'
    should "scope that return active flavors" do
      assert_equal 3, Flavor.active.size
      assert_equal ["Cookies and cream", "Mango Madness", "Very Berry"], Flavor.active.alphabetical.map{|f| f.name}
    end

    

    # test the scope 'inactive'
    should "scope that return inactive flavors" do
      assert_equal 1, Flavor.inactive.size
      assert_equal ["Vanilla"], Flavor.inactive.alphabetical.map{|f| f.name}
    end

    #test callback
    should "check that flavors are not destroyable" do
      assert_equal false, @flavor1.destroyed?
    end


    # should "test callback that makes an undestroyed flavor inactive" do
    #   @flavor1.destroy
    #   @flavor1.reload
    #   assert_equal false, @flavor1.active
    # end

  end
end
