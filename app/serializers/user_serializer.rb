class UserSerializer
  include JSONAPI::Serializer
  attributes :gamertag, :platform, :user_games
end
