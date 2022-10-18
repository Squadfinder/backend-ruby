class UserShowSerializer
 def self.format_user(data1, data2)
   {
     gamertag: data1.gamertag,
     platform: data1.platform,
     games_list: data2.map do |game|
       {
         game_id: game.game_id,
         game_title: game.game_title,
         image_url: game.image_url
       }
     end
   }
 end

end
