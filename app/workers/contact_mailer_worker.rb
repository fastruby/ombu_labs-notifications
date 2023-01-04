class ContactMailerWorker
  include Sidekiq::Worker

  def perform(contact_id)
    return unless (contact = Contact.find(contact_id))

    if contact.email_sent_at.blank?
      ContactMailer.contact_email(contact).deliver_now
      contact.update_column :email_sent_at, Time.current
      Sidekiq.logger.info "Sent email to #{contact.email}"
    else
      Sidekiq.logger.info "Skipping email to #{contact.email}"
    end
  end
end
