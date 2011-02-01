require "mocha"
require 'active_support'

Dir[File.dirname(__FILE__) + "/../lib/**/*.rb"].each {|file| require File.expand_path(file)}

RSpec.configure do |config|
  config.mock_with :mocha
end