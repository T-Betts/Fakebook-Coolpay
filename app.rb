require 'sinatra/base'
require './models/recipient.rb'
require 'dotenv'
Dotenv.load

class FakebookCoolpay < Sinatra::Base
  get '/' do
    erb(:index)
  end

  get '/recipients' do
    @recipients = Recipient.show_all_recipients
    erb(:'recipients/index')
  end

  post '/recipients' do

  end

  run! if app_file == $PROGRAM_NAME
end
