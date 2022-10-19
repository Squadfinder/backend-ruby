class GamesUserSerializer
  include JSONAPI::Serializer
  attributes :gamertag, :platform
end
