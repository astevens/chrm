class TechTitleHeader
  include Mongoid::Document

  field :id, :type => Integer
  field :text, :type => String
  field :sequence, :type => Integer


end
