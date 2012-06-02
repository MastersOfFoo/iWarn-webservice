Sequel.migration do
  change do
    create_table(:events) do
      primary_key :id
      Float :latitude, :null => false
      Float :longitude, :null => false
      String :description
      DateTime :created_at
      DateTime :updated_at
      String :state, :default => "registered"
      String :type, :null => false
    end
  end
end
