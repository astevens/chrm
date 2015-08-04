module Chrome
  class Category
    include Mongoid::Document

    field :id, :type => Integer
    field :text, :type => String
    field :type_filter, :type => String
    field :category_header_id, :type => Integer
    field :user_friendly_name, :type => String

    belongs_to :category_header

    index({:category_header_id => 1})
  end
end
