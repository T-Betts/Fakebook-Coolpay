class Payment
  attr_reader :amount, :currency, :recipient_id

  def initialize(amount, currency, recipient_id)
    @amount = amount
    @currency = currency
    @recipient_id = recipient_id
  end
  
  def self.show_all_payments(service = CoolpayService)
    service.authenticate
    headers = service.authorization_headers
    response = RestClient.get('https://coolpay.herokuapp.com/api/payments', headers)
  end

  def self.create_payment(amount, currency, recipient_id, service = CoolpayService)
    service.authenticate
    new_payment = Payment.new(amount, currency, recipient_id)
    values = {
      "payment": {
        "amount": new_payment.amount,
        "currency": "#{new_payment.currency}",
        "recipient_id": "#{new_payment.recipient_id}"
      }
    }
    headers = service.authorization_headers
    response = RestClient.post('https://coolpay.herokuapp.com/api/payments', values, headers)
  end
end
