require_relative '../models/payment.rb'

describe Payment do
  describe '#self.show_all_payments' do
    it 'shows all payments' do
      payments = Payment.show_all_payments
      expect(payments).to include('"payments": [{"status": "paid", "amount": 10, "currency": "GBP", "recipient_id": "a", "id": "b" }]')
    end
  end

  describe '#self.create_payment' do
    before do
      response_new_payment = '{ "payments": [{"status": "paid", "amount": 10, "currency": "GBP", "recipient_id": "a", "id": "b" }] }'
      stub_request(:post, 'https://coolpay.herokuapp.com/api/payments').to_return(:body => response_new_payment, :status => 200, :headers => {})
    end

    it 'creates a payment' do
      Payment.create_payment(10, "GBP", "id")
      payments = Payment.show_all_payments
      expect(payments).to include('"payments": [{"status": "paid", "amount": 10, "currency": "GBP", "recipient_id": "a", "id": "b" }]')
    end
  end

  describe '#self.check_payment_status' do
    before do
      response_payment = '{ "payments": [{"status": "paid", "amount": 10, "currency": "GBP", "recipient_id": "a", "id": "b" }] }'
      stub_request(:get, 'https://coolpay.herokuapp.com/api/payment/:id').to_return(:body => response_payment, :status => 200, :headers => {})
    end

    it 'checks the status of a payment' do
      expect(Payment.check_payment_status("b")).to eq("status" => "paid", "amount" => 10, "currency" => "GBP", "recipient_id" => "a", "id" => "b")
    end
  end
end
