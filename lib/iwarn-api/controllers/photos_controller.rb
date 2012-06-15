class IWarnApi
  post "/events/:id/photos.json" do
    puts request.env
  end
end
