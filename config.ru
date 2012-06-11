require "./lib/iwarn-api"

$stdout.sync = true

class SetJsonContentType
  def call(response)
    status, headers, body = response
    headers.merge!("Content-Type" => "application/json")
    [status, headers, body]
  end
end

App = Rack::Callbacks.new do
  run IWarnApi
  after SetJsonContentType
end

run App
