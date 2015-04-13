Sequel.migration do
  change do
    create_table :subdivisions do
      Fixnum :model_year
      Fixnum :division_id, :index => true
      primary_key :id
      Fixnum :hist_subdivision_id, :index => true
      String :name
    end
  end
end
