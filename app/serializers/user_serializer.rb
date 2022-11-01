class UserSerializer
  include JSONAPI::Serializer
  attributes :gamertag, :platform, :email, :user_games
end
