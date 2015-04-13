Sequel.migration do
  change do
    create_table :options do
      Fixnum :style_id, :index => true
      Fixnum :option_header_id, :index => true
      Fixnum :sequence
      String :code
      String :desc
      Fixnum :option_kind_id, :index => true
      String :category_list
      String :pon
      String :ext_description
      String :supported_logic
      String :unsupported_logic
      String :price_notes
      primary_key :id
    end
  end
end
