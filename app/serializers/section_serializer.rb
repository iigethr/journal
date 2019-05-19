class SectionSerializer
  include FastJsonapi::ObjectSerializer
  set_type :section
  has_one :union, as: :member
  belongs_to :publication
  attributes :slug, :title
end
