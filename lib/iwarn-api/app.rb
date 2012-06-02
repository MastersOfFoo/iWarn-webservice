class IWarnApi < Nancy::Base
  use Rack::Logger
  use Rack::Session::Cookie
  use Rack::Protection
  use Rack::Protection::RemoteReferrer
  use Rack::PostBodyContentTypeParser
  use Rack::NestedParams

  # TODO: Provide useful info here
  get "/" do
    "iWarn API v1"
  end
end
