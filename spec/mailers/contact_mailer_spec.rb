require "rails_helper"

RSpec.describe ContactMailer, type: :mailer do
  it 'can send an e-mail' do

    user = User.create!(gamertag: "sorryIMbad", platform: "x-box")
    user_2 = User.create!(gamertag: "IMbad", platform: "x-box")

    halo = Squad.create!(game: 'Halo', event_time: Time.now, competitive: 'true')

    email = ContactMailer.submission(user, halo, user_2).deliver_now

    expect(email.subject).to eq("#{user_2.gamertag} invited you to play #{halo.game}!")
    expect(email.to).to eq(["squadfindermailer@gmail.com"])
    expect(email.from).to eq(["squadfinder2205@gmail.com"])

    expect(email.body.encoded).to match("#{user.gamertag}: You&#39;ve been invited to join a squad for #{halo.game} by #{user_2.gamertag}!")
  end

end
