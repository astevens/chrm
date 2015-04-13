Sequel.migration do
  change do
    create_table :construction_infos do
      Fixnum :style_id, :index => true
      Fixnum :type_id, :index => true
      String :text, :size => 2000
      primary_key :id
    end
  end
end
