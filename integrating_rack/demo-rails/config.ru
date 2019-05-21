# This file is used by Rack-based servers to start the application.

require_relative 'lib/status_check_app'
require_relative 'lib/api_key'

require_relative 'config/environment'

run Rails.application
