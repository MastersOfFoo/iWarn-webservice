require "nancy/base"
class IWarnApi < Nancy::Base
  # TODO: Provide useful info here
  get "/" do
    "iWarn API v1"
  end

  # Create a new Event with parameters pased in body
  post "/events" do
    event_attrs = params["event"]
  end

  # Read all existing events from database
  get "/events" do

  end

  # Read the event with the given id
  get "/events/:id" do
    id = params["id"]
  end

  # Update an existing event with the given id
  put "/events/:id" do
    id = params["id"]
    event_attrs = params["event"]
  end
end
