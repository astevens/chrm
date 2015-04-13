Sequel.migration do
  change do
    create_table :normalized_construction_infos do
      Fixnum :style_id, :index => true
      Fixnum :label_id, :index => true
      String :value
      String :qualifier
      String :qualifier_sequence
      Fixnum :group
      primary_key :id
    end
  end
end
