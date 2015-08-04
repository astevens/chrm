module Chrome
  class BodyStyle
    include Mongoid::Document

    field :style_id, :type => Integer
    field :text, :type => String
    field :is_primary, :type => String

    belongs_to :style

    index({:style_id => 1})
  end
end
