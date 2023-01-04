require 'minitest/autorun'

class Contact
    attr_accessor :email, :slack_notified_at, :id

    def self.find
    end

    def update_column(attr, value)
        self.slack_notified_at = value
    end
end 


describe ContactSlackWorker do 
    describe "perform" do
        describe "when slack_notified_at is blank"  do

            it 'sends the email and updates the time stamp' do
            contact = Contact.new

                Contact.stub(:find, contact) do 
                    ContactSlackWorker.new.perform(contact.id)
                    
                end
            _(contact.slack_notified_at).wont_be_nil 
            end
        end
    end
end