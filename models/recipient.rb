require_relative './coolpay_service.rb'

class Recipient
  attr_reader :username

  def initialize(username)
    @username = username
  end

  def self.show_all_recipients(service = CoolpayService)
    token = service.authenticate
    headers = {:content_type => 'application/json', :authorization => "Bearer #{@token}"}
    response = RestClient.get('https://coolpay.herokuapp.com/api/recipients', headers)
  end
end
