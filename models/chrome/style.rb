module Chrome
  class Style
    include Mongoid::Document

    field :id, :type => Integer
    field :hist_style_id, :type => Integer
    field :model_id, :type => Integer
    field :model_year, :type => Integer
    field :sequence, :type => Integer
    field :code, :type => String
    field :full_style_code, :type => Integer
    field :name, :type => String
    field :true_base_price, :type => String
    field :invoice, :type => Float
    field :msrp, :type => Float
    field :destination, :type => Float
    field :cvc_list, :type => String
    field :market_class_id, :type => Integer
    field :name_wo_trim, :type => String
    field :trim, :type => String
    field :passenger_capacity, :type => Integer
    field :passenger_doors, :type => Integer
    field :manual_trans, :type => String
    field :auto_trans, :type => String
    field :front_wd, :type => String
    field :rear_wd, :type => String
    field :all_wd, :type => String
    field :four_wd, :type => String
    field :step_side, :type => String
    field :caption, :type => String
    field :auto_builder_style_id, :type => String
    field :price_state, :type => String
    field :cf_model_name, :type => String
    field :cf_style_name, :type => String
    field :cf_drive_train, :type => String
    field :cf_body_type, :type => String

    belongs_to :model
    belongs_to :market_class

    index({:model_id => 1})
    index({:market_class_id => 1})
  end
end
