require 'faraday_middleware'
require 'hashie/mash'
class ApiConnector
  def connection
    @connection ||= Faraday.new(GIT_HUB_URL) do |conn|
      conn.request  :url_encoded
      conn.response :mashify
      conn.response :json, content_type: 'application/json'
      conn.adapter  Faraday.default_adapter
    end
  end

  def get(path, params = nil)
    connection.get(path) do |request|
      request.params.update(params) if params
    end
  end
end
