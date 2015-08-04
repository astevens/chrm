module Chrome
  class ConstructionInfo
    include Mongoid::Document

    field :style_id, :type => Integer
    field :type_id, :type => Integer
    field :text, :type => String

    belongs_to :style
    belongs_to :type

    index({:style_id => 1})
    index({:type_id => 1})
  end
end
