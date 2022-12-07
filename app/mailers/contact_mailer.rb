# Mailer for the contact form

class ContactMailer < ApplicationMailer
  CONTACT_FORM_TO = ENV["CONTACT_FORM_TO"].presence || "hello@ombulabs.com"
  def contact_email(contact)
    @contact = contact
    mail(subject: "[OmbuLabs] #{contact.email} just sent you a message!",
         to: CONTACT_FORM_TO,
         reply_to: contact.email)
  end
end
