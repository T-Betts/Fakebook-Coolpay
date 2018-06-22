class Payment
  def self.show_all_payments(service = CoolpayService)
    service.authenticate
    headers = service.authorization_headers
    response = RestClient.get('https://coolpay.herokuapp.com/api/payments', headers)
  end
end
