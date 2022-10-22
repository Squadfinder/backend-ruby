require "rails_helper"

RSpec.describe ContactMailer, type: :mailer do
  it 'can send an e-mail' do

    user = User.create!(gamertag: "sorryIMbad", platform: "x-box")
    user_2 = User.create!(gamertag: "IMbad", platform: "x-box")

    halo = Squad.create!(game: 'Halo', event_time: Time.now, competitive: 'true')

    email = ContactMailer.submission(user, halo, user_2).deliver_now
    
    expect(email.subject).to eq("sorryIMbad invited to play Halo.")
    expect(email.to).to eq(["squadfinder2205@gmail.com"])
    expect(email.from).to eq(["squadfinder2205@gmail.com"])

    expect(email.body.encoded).to match("sorryIMbad has been invited to join a squad for Halo by IMbad.")
  end

end
