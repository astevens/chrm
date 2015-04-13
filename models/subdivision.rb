class Subdivision < Sequel::Model
  set_dataset :subdivisions

  # Columns
  # model_year Fixnum
  # division_id Fixnum
  # id Fixnum
  # hist_subdivision_id Fixnum
  # name String
  many_to_one :division
  many_to_one :hist_subdivision
end
