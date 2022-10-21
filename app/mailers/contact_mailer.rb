class ContactMailer < ApplicationMailer
  default from: 'squadfinder2205@gmail.com'

  def submission(user, squad, host)
    @message = "#{user.gamertag} has been invited to join a squad for #{squad.game} by #{host.gamertag}."
    mail(to: "squadfinder2205@gmail.com", subject: "#{user.gamertag} invited to play #{squad.game}.")
  end
end
