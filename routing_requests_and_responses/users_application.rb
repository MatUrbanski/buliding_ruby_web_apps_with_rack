class UsersApplication
  include ApplicationHelpers

  def call(env)
    request                          = Rack::Request.new(env)
    response                         = Rack::Response.new
    response.headers['Content-Type'] = 'application/json'

    if request.path_info == ''
      respond_with_object(response, Database.users)
    elsif request.path_info =~ %r{/\d+}
      id   = request.path_info.split('/').last.to_i
      user = Database.users[id]

      if user.nil?
        error(response, "No user with id #{id}", 404)
      else
        respond_with_object(response, user)
      end

    else
      missing(request, response)
    end

    response.finish
  end
end
