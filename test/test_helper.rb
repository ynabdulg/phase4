require 'simplecov'
SimpleCov.start 'rails'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'


require 'contexts'

include Contexts::StoreContexts
include Contexts::EmployeeContexts
include Contexts::AssignmentContexts
include Contexts::ShiftContexts
include Contexts::JobContexts
include Contexts::FlavorContexts
include Contexts::ShiftJobContexts
include Contexts::StoreFlavorContexts


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #fixtures :all
  # Add more helper methods to be used by all tests here...
  include Contexts
  # Add more helper methods to be used by all tests here...
end
