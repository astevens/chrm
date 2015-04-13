Sequel.migration do
  change do
    create_table :market_classes do
      primary_key :id
      String :text
    end
  end
end
