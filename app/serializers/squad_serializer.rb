class SquadSerializer
  include JSONAPI::Serializer
  attributes :game, :event_time, :number_players, :competitive
end
