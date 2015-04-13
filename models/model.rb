class Model < Sequel::Model
  set_dataset :models

  # Columns
  # id Fixnum
  # hist_model_id Fixnum
  # year Fixnum
  # division_id Fixnum
  # subdivision_id Fixnum
  # name String
  # effective_date String
  # comment String
  many_to_one :hist_model
  many_to_one :division
  many_to_one :subdivision
end
