class Label < Sequel::Model
  set_dataset :labels

  # Columns
  # id Fixnum
  # text String
  # type_id Fixnum
  # sequence Fixnum
  many_to_one :type
end
