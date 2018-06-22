require_relative '../models/recipient.rb'

describe Recipient do
  describe '#self.show_all_recipients' do
    before do
      response_recipients = '{ "name":"Test Recipient" }'
      stub_request(:get, 'https://coolpay.herokuapp.com/api/recipients').to_return(:body => response_recipients, :status => 200, :headers => {})
    end
    it 'shows all the recipients' do
      recipients = Recipient.show_all_recipients
      expect(recipients).to include('"name":"Test Recipient"')
    end
  end

  describe  '#self.create_recipient' do
    before do
      response_recipients = '{ "name":"Test Recipient" }'
      stub_request(:get, 'https://coolpay.herokuapp.com/api/recipients').to_return(:body => response_recipients, :status => 200, :headers => {})
      response_new_recipient = '{ name":"Test Recipient" }'
      stub_request(:post, 'https://coolpay.herokuapp.com/api/recipients').to_return(:body => response_new_recipient, :status => 200, :headers => {})
    end

    it 'creates a recipient' do
      Recipient.create_recipient("Test Recipient")
      recipients = Recipient.show_all_recipients
      expect(recipients).to include('"name":"Test Recipient"')
    end
  end
end
