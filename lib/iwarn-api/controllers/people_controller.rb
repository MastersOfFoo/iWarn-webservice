class IWarnApi
  # Associate people to an event
  post "/events/:id/people.json" do
    begin
      puts params.inspect
      event = Event[params["id"]]
      response["Content-Type"] = "application/json"
      halt 404, "not found" unless event

      params["people"].each do |p|
        person = Person.new(event: event, person_id: p)
        person.save
      end

      halt 201, {}, ArraySerializer.new(event.people).to_json
    rescue
      halt 400, "Bad Request"
    end
  end

  # Get all the people associated to an event
  get "/events/:id/people.json" do
    event = Event[params["id"]]
    response["Content-Type"] = "application/json"
    halt 404, "not found" unless event
    ArraySerializer.new(event.people).to_json
  end
end
