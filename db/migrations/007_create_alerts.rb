Sequel.migration do
  change do
    create_table(:alerts) do
      primary_key :id
      foreign_key :event_id, :events, :null => false
      foreign_key :service_id, :services, :null => false
      DateTime :created_at
      DateTime :updated_at
    end
  end
end
