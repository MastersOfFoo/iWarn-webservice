class IWarnApi
  # Upload a photo to an event
  post "/people/:id/people.json" do
    event = Event[params["id"]]
    response["Content-Type"] = "application/json"
    halt 404, "not found" unless event
    
    #You must choose the person id to add to Person model
    
    person = Person(person_id: , event: event)    
    
    #uploader = PhotoUploader.new(params["uploaded"])
    #uploader.upload!
    #photo = Photo.create(url: uploader.url, event: event)

    if photo.save
      headers = {"Location" => photo_url(event, photo)}
      halt 201, headers, PhotoSerializer.new(photo).to_json
    else
      halt 400, "Bad Request"
    end
  end

  # Get all the photos of an event
  get "/events/:id/photos.json" do
    event = Event[params["id"]]
    response["Content-Type"] = "application/json"
    halt 404, "not found" unless event
    ArraySerializer.new(event.photos).to_json
  end

  def photo_url(event, photo)
    "#{request.scheme}://#{request.host}/events/#{event.id}/photos/#{photo.id}"
  end
end
