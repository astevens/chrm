class Color < Sequel::Model
  set_dataset :colors

  # Columns
  # style_id Fixnum
  # ext1_code String
  # ext2_code String
  # int_code Fixnum
  # ext1_man_code String
  # ext2_man_code String
  # int_man_code String
  # order_code String
  # as_two_tone String
  # ext1_desc String
  # ext2_desc String
  # int_desc String
  # condition String
  # generic_ext_color String
  # generic_ext2_color String
  # ext1_rgb_hex String
  # ext2_rgb_hex String
  # ext1_mfr_full_code String
  # ext2_mfr_full_code String
  # id Fixnum
  many_to_one :style
end
