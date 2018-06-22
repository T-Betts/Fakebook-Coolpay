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
end
