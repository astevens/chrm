Sequel.migration do
  change do
    create_table :colors do
      Fixnum :style_id, :index => true
      String :ext1_code
      String :ext2_code
      Fixnum :int_code
      String :ext1_man_code
      String :ext2_man_code
      String :int_man_code
      String :order_code
      String :as_two_tone
      String :ext1_desc
      String :ext2_desc
      String :int_desc
      String :condition
      String :generic_ext_color
      String :generic_ext2_color
      String :ext1_rgb_hex
      String :ext2_rgb_hex
      String :ext1_mfr_full_code
      String :ext2_mfr_full_code
      primary_key :id
    end
  end
end
