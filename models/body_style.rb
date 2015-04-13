class BodyStyle < Sequel::Model
  set_dataset :body_styles

  # Columns
  # style_id Fixnum
  # text String
  # is_primary String
  # id Fixnum
  many_to_one :style
end
