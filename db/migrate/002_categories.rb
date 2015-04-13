Sequel.migration do
  change do
    create_table :categories do
      primary_key :id
      String :text
      String :type_filter
      Fixnum :category_header_id, :index => true
      String :user_friendly_name
    end
  end
end
