Sequel.migration do
  change do
    create_table :versions do
      String :product
      String :data_version
      Fixnum :data_release_id, :index => true
      String :schema_name
      Float :schema_version
      String :country
      String :language
      primary_key :id
    end
  end
end
