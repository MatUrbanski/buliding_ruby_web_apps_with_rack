require 'json'

module ApplicationHelpers
  def missing(request, response)
    response.status = 404
    response.write('Nothing Here')
  end

  def error(response, message, status = 400)
    response.status = status
    response.write("Error: #{message}")
  end

  def respond_with_object(response, object)
    response.write(JSON.generate(object))
  end
end
