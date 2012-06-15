Sequel.migration do
  change do
    create_table(:vehicles) do
      primary_key :id
      foreign_key :event_id, :events, :null => false
      String :identification_number, :null => false
      Integer :driver_id
      String :description
      DateTime :created_at
      DateTime :updated_at
    end
  end
end
