class UserSerializer
  include JSONAPI::Serializer
  attributes :gamertag, :platform
end
