class UsersSerializer
  include JSONAPI::Serializer

  attributes :gamertag, :platform
  set_id nil
  set_type :user

end
