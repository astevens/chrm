class Standard < Sequel::Model
  set_dataset :standards

  # Columns
  # style_id Fixnum
  # standard_header_id Fixnum
  # sequence Fixnum
  # text String
  # category_list String
  # id Fixnum
  many_to_one :style
  many_to_one :standard_header
end
