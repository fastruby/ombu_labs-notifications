require 'minitest/autorun'

class Contact
    attr_accessor :email, :email_sent_at, :id

    def self.find
    end

    def update_column(attr, value)
        self.email_sent_at = value
    end
end 


describe ContactMailerWorker do 
    describe "perform" do
        describe "when email_sent_at is blank"  do

            it 'sends the email and updates the time stamp' do
            contact = Contact.new

                Contact.stub(:find, contact) do 
                    ContactMailerWorker.new.perform(contact.id)
                    
                end
            _(contact.email_sent_at).wont_be_nil 
            end
        end
    end
end
