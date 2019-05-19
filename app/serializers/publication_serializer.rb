class PublicationSerializer
  include FastJsonapi::ObjectSerializer
  set_type :publication
  has_many :articles
  has_many :sections
  attributes :slug, :title, :description
end
