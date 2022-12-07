require "rails_helper"

RSpec.describe ContactMailerWorker do
  describe "#perform" do
    subject(:contact_worker) { described_class }

    let!(:contact) do
      Contact.create!(name: "Jon Snow",
                      email: "jon@example.com",
                      request_type: "maintenance",
                      message: "Hi! This is a test message.")
    end

    before { Sidekiq::Testing.inline! }

    after { Sidekiq::Testing.fake! }

    it "sends an email to OmbuLabs using the ContactMailer" do
      allow(ContactMailer).to receive(:contact_email).and_call_original

      contact_worker.perform_async(contact.id)

      expect(contact.reload.email_sent_at).to be_within(1.second).of(Time.current)
    end
  end
end
