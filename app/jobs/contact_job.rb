class ContactJob < ApplicationJob
  queue_as :default

  def perform(user, squad, host)
    ContactMailer.submission(user, squad, host).deliver_now
  end
end
