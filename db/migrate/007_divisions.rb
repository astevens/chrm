Sequel.migration do
  change do
    create_table :divisions do
      primary_key :id
      Fixnum :manufacturer_id, :index => true
      String :name
    end
  end
end
