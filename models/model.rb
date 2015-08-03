class Model
  include Mongoid::Document

  field :id, :type => Integer
  field :hist_model_id, :type => Integer
  field :year, :type => Integer
  field :division_id, :type => Integer
  field :subdivision_id, :type => Integer
  field :name, :type => String
  field :effective_date, :type => String
  field :comment, :type => String

  belongs_to :hist_model
  belongs_to :division
  belongs_to :subdivision
end
