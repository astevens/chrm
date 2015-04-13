class StyleCategory < Sequel::Model
  set_dataset :style_categories

  # Columns
  # style_id Fixnum
  # category_id Fixnum
  # feature_type String
  # sequence Fixnum
  # state String
  # id Fixnum
  many_to_one :style
  many_to_one :category
end
