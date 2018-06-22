require 'sinatra/base'

class FakebookCoolpay < Sinatra::Base
  get '/' do
    erb(:index)
  end

  get '/recipients' do
    erb(:'recipients/index')
  end

  post '/recipients' do
    
  end

  run! if app_file == $PROGRAM_NAME
end
