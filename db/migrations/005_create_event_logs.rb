Sequel.migration do
  change do
    create_table(:event_logs) do
      primary_key :id
      foreign_key :event_id, :events, :null => false
      String :log
      DateTime :created_at
      DateTime :updated_at
    end
  end
end
