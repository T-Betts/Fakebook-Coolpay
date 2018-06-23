require_relative '../models/coolpay_service.rb'

describe CoolpayService do
  describe '#self.authenticate' do
    it 'authenticates to Coolpay' do
      CoolpayService.authenticate
      expect(CoolpayService.authenticate).to eq('auth_token')
    end
  end
end
