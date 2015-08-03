class StyleCategory
  include Mongoid::Document

  field :style_id, :type => Integer
  field :category_id, :type => Integer
  field :feature_type, :type => String
  field :sequence, :type => Integer
  field :state, :type => String
  field :id, :type => Integer

  belongs_to :style
  belongs_to :category
end
