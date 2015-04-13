Sequel.migration do
  change do
    create_table :manufacturers do
      primary_key :id
      String :name
    end
  end
end
