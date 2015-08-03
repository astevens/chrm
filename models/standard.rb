class Standard
  include Mongoid::Document

  field :style_id, :type => Integer
  field :standard_header_id, :type => Integer
  field :sequence, :type => Integer
  field :text, :type => String
  field :category_list, :type => String
  field :id, :type => Integer

  belongs_to :style
  belongs_to :standard_header
end
