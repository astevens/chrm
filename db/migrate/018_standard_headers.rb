Sequel.migration do
  change do
    create_table :standard_headers do
      primary_key :id
      String :text
    end
  end
end
