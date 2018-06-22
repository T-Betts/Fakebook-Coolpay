require_relative '../models/payment.rb'

describe Payment do
  describe '#self.show_all_payments' do
    before do
      response_payments = '{ "payments": [{"status": "paid", "amount": 10, "currency": "GBP", "recipient_id": "a", "id": "b" }] }'
      stub_request(:get, 'https://coolpay.herokuapp.com/api/payments').to_return(:body => response_payments, :status => 200, :headers => {})
    end

    it 'shows all payments' do
      payments = Payment.show_all_payments
      expect(payments).to include('"payments": [{"status": "paid", "amount": 10, "currency": "GBP", "recipient_id": "a", "id": "b" }]')
    end
  end

  describe '#self.create_payment' do
    before do
      response_new_payment = '{ "payments": [{"status": "paid", "amount": 10, "currency": "GBP", "recipient_id": "a", "id": "b" }] }'
      stub_request(:post, 'https://coolpay.herokuapp.com/api/payments').to_return(:body => response_new_payment, :status => 200, :headers => {})
      response_payments = '{ "payments": [{"status": "paid", "amount": 10, "currency": "GBP", "recipient_id": "a", "id": "b" }] }'
      stub_request(:get, 'https://coolpay.herokuapp.com/api/payments').to_return(:body => response_payments, :status => 200, :headers => {})
    end

    it 'creates a payment' do
      Payment.create_payment(10, "GBP", "id")
      payments = Payment.show_all_payments
      expect(payments).to include('"payments": [{"status": "paid", "amount": 10, "currency": "GBP", "recipient_id": "a", "id": "b" }]')
    end
  end
end
