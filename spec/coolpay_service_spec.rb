require_relative '../models/coolpay_service.rb'

describe CoolpayService do
  describe '#self.authenticate' do
    before(:each) do
      response_token = '{ "token": "auth_token" }'
      stub_request(:post, 'https://coolpay.herokuapp.com/api/login').to_return(:body => response_token, :status => 200, :headers => {})
    end

    it 'authenticates to Coolpay' do
      CoolpayService.authenticate
      expect(CoolpayService.authenticate).to eq("auth_token")
    end
  end
end
