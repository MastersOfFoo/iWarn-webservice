class IWarnApi
  # Associate vehicles to an event
  post "/events/:id/vehicles.json" do
    begin
      event = Event[params["id"]]
      response["Content-Type"] = "application/json"
      halt 404, "not found" unless event

      params["vehicles"].each do |v|
        vehicle = Vehicle.new(event: event, identification_number: v)
        vehicle.save
      end

      halt 201, {}, ArraySerializer.new(event.vehicles).to_json
    rescue
      halt 400, "Bad Request"
    end
  end

  # Get all the vehicles associated to an event
  get "/events/:id/vehicles.json" do
    event = Event[params["id"]]
    response["Content-Type"] = "application/json"
    halt 404, "not found" unless event
    ArraySerializer.new(event.vehicles).to_json
  end
end
