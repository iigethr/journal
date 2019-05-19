class TextSerializer
  include FastJsonapi::ObjectSerializer
  set_type :text
  has_many :agents, as: :act
end
