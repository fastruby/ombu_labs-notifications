class SlackNotifier
  def notify_new_contact(contact)
    notifier = Slack::Notifier.new ENV["SLACK_WEBHOOK_URL"]
    notifier.ping contact_message(contact)
  end

  def notify_new_free_roadmap(free_roadmap)
    notifier = Slack::Notifier.new ENV["SLACK_ROADRUNNER_WEBHOOK_URL"]
    notifier.ping free_roadmap_message(free_roadmap)
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

  def free_roadmap_message(free_roadmap)
    <<~TEXT
      Hello <!subteam^#{ENV["SLACK_GROUP_ID"]}>!\n
      #{free_roadmap.name.titleize} has submitted a request in our Free Roadmap form :tada: :
      Email: #{free_roadmap.email}
      Company: #{free_roadmap.company}
      Current Ruby Version: #{free_roadmap.current_ruby_version}
      Current Rails Version: #{free_roadmap.current_rails_version}
      Target Rails Version: #{free_roadmap.target_rails_version}

      Cheers,\nYour OmbuLabs Robot!

    TEXT
  end
end
