class Subdivision
  include Mongoid::Document

  field :model_year, :type => Integer
  field :division_id, :type => Integer
  field :id, :type => Integer
  field :hist_subdivision_id, :type => Integer
  field :name, :type => String

  belongs_to :division
  belongs_to :hist_subdivision
end
