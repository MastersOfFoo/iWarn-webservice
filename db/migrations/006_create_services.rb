Sequel.migration do
  change do
    create_table(:services) do
      primary_key :id
      String :name, :null => false
      String :number, :null => false
      DateTime :created_at
      DateTime :updated_at
    end
  end
end
