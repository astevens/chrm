class ConstructionInfo
  include Mongoid::Document

  field :style_id, :type => Integer
  field :type_id, :type => Integer
  field :text, :type => String
  field :id, :type => Integer

  belongs_to :style
  belongs_to :type
end
