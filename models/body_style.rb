class BodyStyle
  include Mongoid::Document

  field :style_id, :type => Integer
  field :text, :type => String
  field :is_primary, :type => String
  field :id, :type => Integer

  belongs_to :style
end
