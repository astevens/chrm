Sequel.migration do
  change do
    create_table :tech_titles do
      Fixnum :tech_title_id, :index => true
      Fixnum :sequence
      String :text
      Fixnum :tech_header_id, :index => true
      primary_key :id
    end
  end
end
