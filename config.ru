require 'test/api'

use Rack::ShowExceptions

run Rack::URLMap.new \
  '/'              => Test::API::Service.new
