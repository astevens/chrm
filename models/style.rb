class Style < Sequel::Model
  set_dataset :styles

  # Columns
  # id Fixnum
  # hist_style_id Fixnum
  # model_id Fixnum
  # model_year Fixnum
  # sequence Fixnum
  # code String
  # full_style_code String
  # name String
  # true_base_price String
  # invoice Float
  # msrp Float
  # destination Float
  # cvc_list String
  # market_class_id Fixnum
  # name_wo_trim String
  # trim String
  # passenger_capacity Fixnum
  # passenger_doors Fixnum
  # manual_trans String
  # auto_trans String
  # front_wd String
  # rear_wd String
  # all_wd String
  # four_wd String
  # step_side String
  # caption String
  # auto_builder_style_id String
  # price_state String
  # cf_model_name String
  # cf_style_name String
  # cf_drive_train String
  # cf_body_type String
  many_to_one :hist_style
  many_to_one :model
  many_to_one :market_class
  many_to_one :auto_builder_style
end
