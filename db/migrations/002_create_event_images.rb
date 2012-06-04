Sequel.migration do
  change do
    create_table(:event_photos) do
      primary_key :id
      foreign_key :event_id
      String :url_photo_server
    end
  end
end
