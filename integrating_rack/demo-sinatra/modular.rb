require 'sinatra/base'

class Modular < Sinatra::Base
  use Rack::Runtime

  get '/' do
    "Modular text"
  end
end

