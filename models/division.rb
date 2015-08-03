class Division
  include Mongoid::Document

  field :id, :type => Integer
  field :manufacturer_id, :type => Integer
  field :name, :type => String

  belongs_to :manufacturer
end
