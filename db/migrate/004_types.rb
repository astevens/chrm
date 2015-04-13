Sequel.migration do
  change do
    create_table :types do
      primary_key :id
      String :text
    end
  end
end
