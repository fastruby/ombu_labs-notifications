require "rails_helper"

RSpec.describe ContactSlackWorker do
  describe "#perform" do
    subject(:contact_worker) { described_class }

    let!(:contact) do
      Contact.create!(name: "Jon Snow",
                      email: "jon@example.com",
                      request_type: "maintenance",
                      message: "Hi! This is a test message.")
    end

    let(:slack_notifier) { instance_double(SlackNotifier, notify_new_contact: nil) }

    before do
      allow(SlackNotifier).to receive(:new).and_return(slack_notifier)
      Sidekiq::Testing.inline!
    end

    after { Sidekiq::Testing.fake! }

    it "sends a slack message using the SlackNotifier" do
      expect(slack_notifier).to receive(:notify_new_contact)

      contact_worker.perform_async(contact.id)

      expect(contact.reload.slack_notified_at).to be_within(1.second).of(Time.current)
    end
  end
end
