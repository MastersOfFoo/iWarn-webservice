class IWarnApi < Nancy::Base
  use Rack::Protection
  use Rack::Protection::RemoteReferrer

  # TODO: Provide useful info here
  get "/" do
    "iWarn API v1"
  end
end
