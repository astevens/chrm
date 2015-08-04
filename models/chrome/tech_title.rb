module Chrome
  class TechTitle
    include Mongoid::Document

    field :tech_title_id, :type => Integer
    field :sequence, :type => Integer
    field :text, :type => String
    field :tech_header_id, :type => Integer

    belongs_to :tech_title
    belongs_to :tech_header

    index({:tech_title_id => 1})
    index({:tech_header_id => 1})
  end
end
