module Chrome
  class Subdivision
    include Mongoid::Document

    field :model_year, :type => Integer
    field :division_id, :type => Integer
    field :id, :type => Integer
    field :hist_subdivision_id, :type => Integer
    field :name, :type => String

    belongs_to :division

    index({:division_id => 1})
  end
end
