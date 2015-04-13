Sequel.migration do
  change do
    create_table :labels do
      primary_key :id
      String :text
      Fixnum :type_id, :index => true
      Fixnum :sequence
    end
  end
end
