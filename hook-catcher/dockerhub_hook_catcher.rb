require 'sinatra'
require 'json'

get '/' do
  File.read(File.join('docker-hub.json', 'index.html'))
end

post '/payload' do
  push = JSON.parse(request.body.read)
  File.open('docker-hub.json', 'w') do |f|
    f.write(JSON.pretty_generate(push))
  end
end
