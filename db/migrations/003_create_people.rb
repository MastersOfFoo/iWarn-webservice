Sequel.migration do
  change do
    create_table(:people) do
      primary_key :id
      foreign_key :event_id, :events, :null => false
      Integer :person_id, :null => false
      String :description
      DateTime :created_at
      DateTime :updated_at
    end
  end
end
