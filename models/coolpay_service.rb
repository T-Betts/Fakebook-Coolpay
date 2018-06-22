require 'rest-client'

class CoolpayService
  def self.authenticate
    values = "{'username': '#{ENV['USERNAME']}', 'apikey': '#{ENV['API_KEY']}'}"
    headers = {content_type: 'application/json'}
    response = RestClient.post 'https://coolpay.herokuapp.com/api/login', values, headers
    @token = JSON.parse(response)['token']
  end
end
