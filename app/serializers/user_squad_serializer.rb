class UserSquadSerializer
  include JSONAPI::Serializer
  attributes :user_id, :host_id, :squad_id, :status
end
