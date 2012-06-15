class IWarnApi
  # Associate people to an event
  post "/vehicles/:id/vehicle.json" do
    begin
      event = Event[params["id"]]
      response["Content-Type"] = "application/json"
      halt 404, "not found" unless event

      params["vehicle"].each do |p|
        vehicle = Vehicle.new(event: event, person_id: p)
        vehicle.save
      end

      halt 201, headers, ArraySerializer.new(event.vehicles).to_json
    rescue
      halt 400, "Bad Request"
    end
  end

  # Get all the people associated to an event
  get "/vehicles/:id/vehicle.json" do
    event = Event[params["id"]]
    response["Content-Type"] = "application/json"
    halt 404, "not found" unless event
    ArraySerializer.new(event.vehicles).to_json
  end
end
