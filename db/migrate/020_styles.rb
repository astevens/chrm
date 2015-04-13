Sequel.migration do
  change do
    create_table :styles do
      primary_key :id
      Fixnum :hist_style_id, :index => true
      Fixnum :model_id, :index => true
      Fixnum :model_year
      Fixnum :sequence
      String :code
      String :full_style_code
      String :name
      String :true_base_price
      Float :invoice
      Float :msrp
      Float :destination
      String :cvc_list
      Fixnum :market_class_id, :index => true
      String :name_wo_trim
      String :trim
      Fixnum :passenger_capacity
      Fixnum :passenger_doors
      String :manual_trans
      String :auto_trans
      String :front_wd
      String :rear_wd
      String :all_wd
      String :four_wd
      String :step_side
      String :caption
      String :auto_builder_style_id, :index => true
      String :price_state
      String :cf_model_name
      String :cf_style_name
      String :cf_drive_train
      String :cf_body_type
    end
  end
end
