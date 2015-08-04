module Chrome
  class NormalizedConstructionInfo
    include Mongoid::Document

    field :style_id, :type => Integer
    field :label_id, :type => Integer
    field :value, :type => Integer
    field :qualifier, :type => String
    field :qualifier_sequence, :type => String
    field :group, :type => Integer

    belongs_to :style
    belongs_to :label

    index({:style_id => 1})
    index({:label_id => 1})
  end
end
