require 'sinatra/base'
require './models/recipient.rb'
require './models/payment.rb'
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

  post '/recipients/new' do
    Recipient.create_recipient(params[:username])
    redirect('/recipients')
  end

  get '/payments' do
    @payments = Payment.show_all_payments
    erb(:'payments/index')
  end

  post '/payments' do
    Payment.create_payment(params[:amount], params[:currency], params[:recipient_id])
    redirect('/payments')
  end

  get '/payments/:id' do
    @payment = Payment.check_payment_status(params[:payment_id])
    erb(:'payments/show')
  end

  run! if app_file == $PROGRAM_NAME
end
