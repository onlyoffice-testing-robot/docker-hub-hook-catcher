require 'sinatra'
require 'json'

get '/' do
  send_file 'docker-hub.json'
end

post '/payload' do
  push = JSON.parse(request.body.read)
  File.open('docker-hub.json', 'w') do |f|
    f.write(JSON.pretty_generate(push))
  end
end
