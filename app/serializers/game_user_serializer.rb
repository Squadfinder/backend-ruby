class GameUserSerializer
  include JSONAPI::Serializer
  attributes :gamertag, :platform
end
