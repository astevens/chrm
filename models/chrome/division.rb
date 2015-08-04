module Chrome
  class Division
    include Mongoid::Document

    field :id, :type => Integer
    field :manufacturer_id, :type => Integer
    field :name, :type => String

    belongs_to :manufacturer

    index({:manufacturer_id => 1})
  end
end
