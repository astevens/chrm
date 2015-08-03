class Price
  include Mongoid::Document

  field :style_id, :type => Integer
  field :sequence, :type => Integer
  field :option_code, :type => String
  field :rule_desc, :type => String
  field :condition, :type => String
  field :invoice, :type => Float
  field :msrp, :type => Float
  field :state, :type => String
  field :id, :type => Integer

  belongs_to :style
end
