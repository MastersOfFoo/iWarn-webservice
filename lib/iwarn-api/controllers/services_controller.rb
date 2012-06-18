class IWarnApi
  # Read all existing events
  get "/services.json" do
    services = Service.order(:id.asc).all
    response["Content-Type"] = "application/json"
    ArraySerializer.new(services).to_json
  end
end
