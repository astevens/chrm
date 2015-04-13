class Division < Sequel::Model
  set_dataset :divisions

  # Columns
  # id Fixnum
  # manufacturer_id Fixnum
  # name String
  many_to_one :manufacturer
end
