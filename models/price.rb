class Price < Sequel::Model
  set_dataset :prices

  # Columns
  # style_id Fixnum
  # sequence Fixnum
  # option_code String
  # rule_desc String
  # condition String
  # invoice Float
  # msrp Float
  # state String
  # id Fixnum
  many_to_one :style
end
