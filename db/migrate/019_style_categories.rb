Sequel.migration do
  change do
    create_table :style_categories do
      Fixnum :style_id, :index => true
      Fixnum :category_id, :index => true
      String :feature_type
      Fixnum :sequence
      String :state
      primary_key :id
    end
  end
end
