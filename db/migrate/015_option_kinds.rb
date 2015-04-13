Sequel.migration do
  change do
    create_table :option_kinds do
      primary_key :id
      String :text
    end
  end
end
