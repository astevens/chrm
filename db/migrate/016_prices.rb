Sequel.migration do
  change do
    create_table :prices do
      Fixnum :style_id, :index => true
      Fixnum :sequence
      String :option_code
      String :rule_desc
      String :condition
      Float :invoice
      Float :msrp
      String :state
      primary_key :id
    end
  end
end
