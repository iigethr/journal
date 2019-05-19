class ArticleSerializer
  include FastJsonapi::ObjectSerializer
  set_type :article
  has_one :union, as: :member
  belongs_to :publication
  attributes :slug, :title, :description
end
