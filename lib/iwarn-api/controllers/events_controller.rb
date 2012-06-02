class IWarnApi
  # Create a new event with parameters pased in body
  post "/events.json" do
    event_attrs = params["event"]
  end

  # Read all existing events from database
  get "/events.json" do

  end

  # Read the event with the given id
  get "/events/:id.json" do
    id = params["id"]
    event = Event[id]
    response["Content-Type"] = "application/json"
    halt 404, "not found" unless event
    EventSerializer.new(event).to_json
  end

  # Update an existing event with the given id
  put "/events/:id.json" do
    id = params["id"]
    event_attrs = params["event"]
  end
end
