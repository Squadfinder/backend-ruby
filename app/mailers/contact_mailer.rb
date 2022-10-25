class ContactMailer < ApplicationMailer
  default from: 'squadfinder2205@gmail.com'

  def submission(user, squad, host)
    @message = "#{user.gamertag}: You've been invited to join a squad for #{squad.game} by #{host.gamertag}!"
    mail(to: "squadfindermailer@gmail.com", subject: "#{host.gamertag} invited you to play #{squad.game}!")
  end
end
