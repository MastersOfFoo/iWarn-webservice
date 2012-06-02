class IWarnApi
  # Create a new event with parameters pased in body
  post "/events.json" do
    event_attrs = params["event"]
    event = Event.new(event_attrs)
    response["Content-Type"] = "application/json"
    if event.save
      headers = {"Location" => location_for_event(event)}
      halt 201, headers, EventSerializer.new(event).to_json
    else
      halt 400, "Bad Request"
    end
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

  def location_for_event(event)
    "#{request.scheme}://#{request.host}/events/#{event.id}"
  end
end
