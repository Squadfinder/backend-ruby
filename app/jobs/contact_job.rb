class ContactJob < ApplicationJob
  queue_as :default

  def perform
    ContactMailer.send.deliver_now
  end
end
