Sequel.migration do
  change do
    create_table :standards do
      Fixnum :style_id, :index => true
      Fixnum :standard_header_id, :index => true
      Fixnum :sequence
      String :text
      String :category_list
      primary_key :id
    end
  end
end
