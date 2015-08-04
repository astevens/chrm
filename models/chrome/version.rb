module Chrome
  class Version
    include Mongoid::Document

    field :product, :type => String
    field :data_version, :type => String
    field :data_release_id, :type => Integer
    field :schema_name, :type => String
    field :schema_version, :type => Float
    field :country, :type => String
    field :language, :type => String

    belongs_to :data_release

    index({:data_release_id => 1})
  end
end
