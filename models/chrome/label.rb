module Chrome
  class Label
    include Mongoid::Document

    field :id, :type => Integer
    field :text, :type => String
    field :type_id, :type => Integer
    field :sequence, :type => Integer

    belongs_to :type

    index({:type_id => 1})
  end
end
