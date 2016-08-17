require 'sinatra'
require 'json'

get '/' do
  if File.exist?('docker-hub.json')
    send_file 'docker-hub.json'
  else
    'There is no payload send earlier to this server'
  end
end

get '/payload' do
  redirect '/'
end

post '/payload' do
  push = JSON.parse(request.body.read)
  File.open('docker-hub.json', 'w') do |f|
    f.write(JSON.pretty_generate(push))
  end
end
