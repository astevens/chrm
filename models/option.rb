class Option
  include Mongoid::Document

  field :style_id, :type => Integer
  field :option_header_id, :type => Integer
  field :sequence, :type => Integer
  field :code, :type => String
  field :desc, :type => String
  field :option_kind_id, :type => Integer
  field :category_list, :type => String
  field :pon, :type => String
  field :ext_description, :type => String
  field :supported_logic, :type => String
  field :unsupported_logic, :type => String
  field :price_notes, :type => String
  field :id, :type => Integer

  belongs_to :style
  belongs_to :option_header
  belongs_to :option_kind
end
