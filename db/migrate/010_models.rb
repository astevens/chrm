Sequel.migration do
  change do
    create_table :models do
      primary_key :id
      Fixnum :hist_model_id, :index => true
      Fixnum :year
      Fixnum :division_id, :index => true
      Fixnum :subdivision_id, :index => true
      String :name
      String :effective_date
      String :comment
    end
  end
end
