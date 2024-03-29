class RidesApplication
  include ApplicationHelpers

  def call(env)
    request                          = Rack::Request.new(env)
    response                         = Rack::Response.new
    response.headers['Content-Type'] = 'application/json'

    case request.path_info
    when request.post? && ""
      post_a_ride(request, response)
    when request.get? && ""
      get_all_rides(request, response)
    when %r{/\d+}
      get_a_ride(request, response)
    else
      missing(request, response)
    end

    response.finish
  end

  def post_a_ride(request, reponse)
    ride = JSON.parse(request.body.read)

    if ride['user_id'].nil?
      error(response, 'user_id field is required')
    else
      Database.add_ride(ride)
      response.write({ message: 'Ride received' })
    end

  rescue JSON::ParserError
    error(response, 'Invalid JSON')
  end

  def get_all_rides(request, response)
    respond_with_object(response, Database.rides)
  end

  def get_a_ride(request, response)
    id = request.path_info.split('/').last.to_i

    respond_with_object(response, Database.rides[id])
  end
end
