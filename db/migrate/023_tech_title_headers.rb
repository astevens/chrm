Sequel.migration do
  change do
    create_table :tech_title_headers do
      primary_key :id
      String :text
      Fixnum :sequence
    end
  end
end
