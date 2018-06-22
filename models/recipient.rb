require_relative './coolpay_service.rb'

class Recipient
  attr_reader :username

  def initialize(username)
    @username = username
  end

  def self.show_all_recipients(service = CoolpayService)
    token = service.authenticate
    headers = {:content_type => 'application/json', :authorization => "Bearer #{token}"}
    response = RestClient.get('https://coolpay.herokuapp.com/api/recipients', headers)
  end

  def self.create_recipient(username, service = CoolpayService)
    token = service.authenticate
    new_recipient = Recipient.new(username)
    values = {"recipient":{"name": "#{new_recipient.username}"}}
    headers = {:content_type => 'application/json', :authorization => "Bearer #{token}"}
    response = RestClient.post('https://coolpay.herokuapp.com/api/recipients', values, headers)
  end
end
