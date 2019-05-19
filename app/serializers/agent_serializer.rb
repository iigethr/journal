class AgentSerializer
  include FastJsonapi::ObjectSerializer
  set_type :agent
  belongs_to :act, polymorphic: true
  belongs_to :union
end
