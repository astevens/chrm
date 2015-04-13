class ConstructionInfo < Sequel::Model
  set_dataset :construction_infos

  # Columns
  # style_id Fixnum
  # type_id Fixnum
  # text String
  # id Fixnum
  many_to_one :style
  many_to_one :type
end
