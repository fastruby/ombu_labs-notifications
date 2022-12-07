class ContactHubspotWorker
  include Sidekiq::Worker

  def perform(contact_id)
    return unless (contact = Contact.find(contact_id))

    if contact.hubspot_notified_at.blank?
      HubspotService.new(contact: contact).save_lead_info
      contact.update_column :hubspot_notified_at, Time.current
      Sidekiq.logger.info "Hubspot sync complete (#{contact.email})"
    else
      Sidekiq.logger.info "Skipping hubspot sync (#{contact.email})"
    end
  end
end
