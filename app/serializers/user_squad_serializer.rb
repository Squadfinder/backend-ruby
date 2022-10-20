class UserSquadSerializer
  include JSONAPI::Serializer
  attributes :squad do |user_squad|
    {
      game: user_squad.squad.game,
      event_time: user_squad.squad.event_time,
      number_players: user_squad.squad.number_players,
      competitive: user_squad.squad.competitive,
      members: user_squad.squad.users
    }
  end
end
