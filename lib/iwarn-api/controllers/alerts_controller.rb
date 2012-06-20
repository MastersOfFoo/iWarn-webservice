class IWarnApi
  # Create an alert of an Event of the given id
  post "/events/:id/alerts.json" do
    begin
      event = Event[params["id"]]
      service = Service[params["alert"]["service_id"]]
      response["Content-Type"] = "application/json"
      halt 404, "not found" unless event || service
      
      alert = Alert.new(event: event, service: service, message: params["alert"]["message"]+" "+event.address)
      alert.save
      headers = {"Location" => alert_url(alert, event)}
      halt 201, headers, AlertSerializer.new(alert).to_json
    rescue
      halt 400, "Bad Request"
    end
  end

  # Get all the alerts from the given id of the event
  get "/events/:id/alerts.json" do
    event = Event[params["id"]]
    response["Content-Type"] = "application/json"
    halt 404, "not found" unless event
    ArraySerializer.new(event.alerts).to_json
  end

  def alert_url(alert, event)
    "#{request.scheme}://#{request.host}/events/#{event.id}/alerts/#{alert.id}"
  end
end
