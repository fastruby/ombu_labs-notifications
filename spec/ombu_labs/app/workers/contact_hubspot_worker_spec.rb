require "rails_helper"

RSpec.describe ContactHubspotWorker do
  describe "#perform" do
    subject(:contact_worker) { described_class }

    let!(:contact) do
      Contact.create!(name: "Jon Snow",
                      email: "jon@example.com",
                      request_type: "maintenance",
                      message: "Hi! This is a test message.")
    end

    let(:hubspot_service) { instance_double(HubspotService) }

    before do
      allow(HubspotService).to receive(:new).and_return(hubspot_service)
      allow(hubspot_service).to receive(:save_lead_info).and_return(true)
      Sidekiq::Testing.inline!
    end

    after { Sidekiq::Testing.fake! }

    it "saves the lead using the HubspotService" do
      expect(hubspot_service).to receive(:save_lead_info)

      contact_worker.perform_async(contact.id)

      expect(contact.reload.hubspot_notified_at).to be_within(1.second).of(Time.current)
    end
  end
end
