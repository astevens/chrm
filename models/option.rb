class Option < Sequel::Model
  set_dataset :options

  # Columns
  # style_id Fixnum
  # option_header_id Fixnum
  # sequence Fixnum
  # code String
  # desc String
  # option_kind_id Fixnum
  # category_list String
  # pon String
  # ext_description String
  # supported_logic String
  # unsupported_logic String
  # price_notes String
  # id Fixnum
  many_to_one :style
  many_to_one :option_header
  many_to_one :option_kind
end
