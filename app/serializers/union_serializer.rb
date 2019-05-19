class UnionSerializer
  include FastJsonapi::ObjectSerializer
  set_type :union
  has_many :agents
end
