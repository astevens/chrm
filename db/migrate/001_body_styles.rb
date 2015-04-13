Sequel.migration do
  change do
    create_table :body_styles do
      Fixnum :style_id, :index => true
      String :text
      String :is_primary
      primary_key :id
    end
  end
end
