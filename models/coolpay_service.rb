require 'rest-client'

class CoolpayService
  def self.authenticate
    values = {"username": "#{ENV['USERNAME']}", "apikey": "#{ENV['APIKEY']}"}
    p values
    headers = {content_type: 'application/json'}
    response = RestClient.post 'https://coolpay.herokuapp.com/api/login', values, headers
    @token = JSON.parse(response)['token']
  end

  def self.authorization_headers
    {:content_type => 'application/json', :authorization => "Bearer #{@token}"}
  end
end
