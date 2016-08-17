require 'sinatra'
require 'json'

NO_PAYLOAD_MESSAGE = 'There is no payload send earlier to this server'.freeze

get '/payload' do
  redirect '/'
end

get '/' do
  if File.exist?('docker-hub.json')
    send_file 'docker-hub.json'
  else
    NO_PAYLOAD_MESSAGE
  end
end

post '/payload' do
  push = JSON.parse(request.body.read)
  File.open('docker-hub.json', 'w') do |f|
    f.write(JSON.pretty_generate(push))
  end
end
