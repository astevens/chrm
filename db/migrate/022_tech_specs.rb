Sequel.migration do
  change do
    create_table :tech_specs do
      Fixnum :style_id, :index => true
      Fixnum :tech_title_id, :index => true
      Fixnum :sequence
      String :text
      String :condition
      primary_key :id
    end
  end
end
