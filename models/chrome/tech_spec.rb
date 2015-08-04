module Chrome
  class TechSpec
    include Mongoid::Document

    field :style_id, :type => Integer
    field :tech_title_id, :type => Integer
    field :sequence, :type => Integer
    field :text, :type => String
    field :condition, :type => String

    belongs_to :style
    belongs_to :tech_title

    index({:style_id => 1})
    index({:tech_title_id => 1})
  end
end
