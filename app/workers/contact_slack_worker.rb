class ContactSlackWorker
  include Sidekiq::Worker

  def perform(contact_id)
    return unless (contact = Contact.find(contact_id))

    if contact.slack_notified_at.blank?
      SlackNotifier.new.notify_new_contact(contact)
      contact.update_column :slack_notified_at, Time.current
      Sidekiq.logger.info "Slack notification sent: #{contact.email}"
    else
      Sidekiq.logger.info "Slack notification skipped: #{contact.email}"
    end
  end
end
