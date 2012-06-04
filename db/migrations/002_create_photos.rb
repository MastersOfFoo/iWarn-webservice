Sequel.migration do
  change do
    create_table(:photos) do
      primary_key :id
      foreign_key :event_id, :events, :null => false
      String :url, :null => false
      DateTime :created_at
      DateTime :updated_at
    end
  end
end
