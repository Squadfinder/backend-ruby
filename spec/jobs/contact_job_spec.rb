require 'rails_helper'

RSpec.describe ContactJob, type: :job do
  it 'can enqueu a job' do

    user = User.create!(gamertag: "sorryIMbad", platform: "x-box")
    user_2 = User.create!(gamertag: "IMbad", platform: "x-box")

    halo = Squad.create!(game: 'Halo', event_time: Time.now, competitive: 'true')

    ActiveJob::Base.queue_adapter = :test

    expect{ContactJob.perform_later(user_2.id,halo.id,user.id)}.to have_enqueued_job

  end

end
