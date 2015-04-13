class TechSpec < Sequel::Model
  set_dataset :tech_specs

  # Columns
  # style_id Fixnum
  # tech_title_id Fixnum
  # sequence Fixnum
  # text String
  # condition String
  # id Fixnum
  many_to_one :style
  many_to_one :tech_title
end
