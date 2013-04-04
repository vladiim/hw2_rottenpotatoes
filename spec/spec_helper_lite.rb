require 'rspec/autorun'
require 'ostruct'
require 'rr'

Dir["#{Dir.pwd}/lib/modules/copy_generator/*.rb"].each { |f| require f }

RSpec.configure { |config| config.mock_with :rr }