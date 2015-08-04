module Chrome
  class StyleCategory
    include Mongoid::Document

    field :style_id, :type => Integer
    field :category_id, :type => Integer
    field :feature_type, :type => String
    field :sequence, :type => Integer
    field :state, :type => String

    belongs_to :style
    belongs_to :category

    index({:style_id => 1})
    index({:category_id => 1})
  end
end
