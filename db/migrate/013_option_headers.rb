Sequel.migration do
  change do
    create_table :option_headers do
      primary_key :id
      String :text
    end
  end
end
