class Category < Sequel::Model
  set_dataset :categories

  # Columns
  # id Fixnum
  # text String
  # type_filter String
  # category_header_id Fixnum
  # user_friendly_name String
  many_to_one :category_header
end
