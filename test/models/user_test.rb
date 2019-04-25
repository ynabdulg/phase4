require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Test relationships
  should belong_to(:employee)
  
  # test Validations
   #should  validate_presence_of(:employee_id)
   should  validate_presence_of(:email) 
    
  #uniqueness
    validate_uniqueness_of(:email)
end
