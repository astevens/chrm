class TechTitle < Sequel::Model
  set_dataset :tech_titles

  # Columns
  # tech_title_id Fixnum
  # sequence Fixnum
  # text String
  # tech_header_id Fixnum
  # id Fixnum
  many_to_one :tech_title
  many_to_one :tech_header
end
