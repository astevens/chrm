module Chrome
  class StandardHeader
    include Mongoid::Document

    field :id, :type => Integer
    field :text, :type => String




  end
end
