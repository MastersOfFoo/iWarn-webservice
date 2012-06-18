class IWarnApi
  # Get all the event logs of an event
  get "/events/:id/event_logs.json" do
    event = Event[params["id"]]
    response["Content-Type"] = "application/json"
    halt 404, "not found" unless event
    ArraySerializer.new(event.event_logs).to_json
  end
end
