class Version < Sequel::Model
  set_dataset :versions

  # Columns
  # product String
  # data_version String
  # data_release_id Fixnum
  # schema_name String
  # schema_version Float
  # country String
  # language String
  # id Fixnum
  many_to_one :data_release
end
