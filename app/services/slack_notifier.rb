class SlackNotifier
  def notify_new_contact(contact)
    notifier = Slack::Notifier.new ENV["SLACK_WEBHOOK_URL"]
    notifier.ping contact_message(contact)
  end

  private

  def contact_message(contact)
    <<~TEXT
      Hello <!subteam^#{ENV["SLACK_GROUP_ID"]}>!\n
      #{contact.name.titleize} has submitted the following message in our contact form :tada: :
      ```
      #{contact.message}
      ```
      Email: #{contact.email}
      How they found us: #{contact.found_us}
      Request Type: #{contact["request_type"]&.titleize || contact["product"]&.titleize}\n
      In House Developers: #{contact["in_house_developers"]}\n
      They plan to start at: #{contact["starting_at"]}\n
      Cheers,\nYour OmbuLabs Robot!

    TEXT
  end
end
