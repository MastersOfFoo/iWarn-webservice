class IWarnApi
  # Upload a photo to an event
  post "/vehicles/:id/vehicles.json" do
    event = Event[params["id"]]
    response["Content-Type"] = "application/json"
    halt 404, "not found" unless event
     #We have to decided if receive just one Vehicle id or varios in json variable
    
    vehicle = Vehicle.create(identification_number: , event: event)   
    #uploader = PhotoUploader.new(params["uploaded"])
    #uploader.upload!
    #photo = Photo.create(url: uploader.url, event: event)

    if vehicle.save
      headers = {"Location" => photo_url(event, photo)}
      halt 201, headers, PhotoSerializer.new(photo).to_json
    else
      halt 400, "Bad Request"
    end
  end

  # Get all the photos of an event
  get "/vehicles/:id/photos.json" do
    event = Event[params["id"]]
    response["Content-Type"] = "application/json"
    halt 404, "not found" unless event
    ArraySerializer.new(event.vehicles).to_json
  end

  def photo_url(event, photo)
    "#{request.scheme}://#{request.host}/events/#{event.id}/photos/#{photo.id}"
  end
end
