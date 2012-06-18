class IWarnApi
  # Create an alert of an Event of the given id
  post "/events/:id/alerts.json" do
    event = Event[params["id"]]
    service = Service[params["service_id"]]
    alert = Alert.new(event: event, service: service)    
    response["Content-Type"] = "application/json"
        
    if alert.save
      headers = {"Location" => alert_url(alert, event)}
      halt 201, headers, AlertSerializer.new(alert).to_json
    else
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
