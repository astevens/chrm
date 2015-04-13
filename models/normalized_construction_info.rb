class NormalizedConstructionInfo < Sequel::Model
  set_dataset :normalized_construction_infos

  # Columns
  # style_id Fixnum
  # label_id Fixnum
  # value String
  # qualifier String
  # qualifier_sequence String
  # group Fixnum
  # id Fixnum
  many_to_one :style
  many_to_one :label
end
