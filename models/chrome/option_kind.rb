module Chrome
  class OptionKind
    include Mongoid::Document

    field :id, :type => Integer
    field :text, :type => String




  end
end
