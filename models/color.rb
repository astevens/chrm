class Color
  include Mongoid::Document

  field :style_id, :type => Integer
  field :ext1_code, :type => Integer
  field :ext2_code, :type => String
  field :int_code, :type => Integer
  field :ext1_man_code, :type => String
  field :ext2_man_code, :type => String
  field :int_man_code, :type => String
  field :order_code, :type => String
  field :as_two_tone, :type => String
  field :ext1_desc, :type => String
  field :ext2_desc, :type => String
  field :int_desc, :type => String
  field :condition, :type => String
  field :generic_ext_color, :type => String
  field :generic_ext2_color, :type => String
  field :ext1_rgb_hex, :type => String
  field :ext2_rgb_hex, :type => String
  field :ext1_mfr_full_code, :type => String
  field :ext2_mfr_full_code, :type => String
  field :id, :type => Integer

  belongs_to :style
end
