require "simplecov"

SimpleCov.start

$:.unshift File.expand_path("../..", __FILE__)

require "magnum-integration"
require "webmock"
require "webmock/rspec"

def fixture_path(file=nil)
  path = File.expand_path("../fixtures", __FILE__)
  file.nil? ? path : File.join(path, file)
end

def fixture(file)
  File.read(fixture_path(file))
end