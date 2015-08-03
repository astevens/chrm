class TechTitle
  include Mongoid::Document

  field :tech_title_id, :type => Integer
  field :sequence, :type => Integer
  field :text, :type => String
  field :tech_header_id, :type => Integer
  field :id, :type => Integer

  belongs_to :tech_title
  belongs_to :tech_header
end
