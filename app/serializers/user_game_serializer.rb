class UserGameSerializer
  include JSONAPI::Serializer
  attributes :user_id, :game_id, :image_url, :game_title
end
