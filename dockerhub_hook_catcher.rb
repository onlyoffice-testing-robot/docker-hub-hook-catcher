require 'sinatra'
require 'json'
require_relative 'helpers/app_helper'

include AppHelper

NO_PAYLOAD_MESSAGE = 'There is no payload send earlier to this server'.freeze
CORRECT_PAYLOAD = 'Correct payload recieved'.freeze
FILE_WITH_DATA = 'docker-hub.json'.freeze

get '/payload' do
  redirect '/'
end

get '/' do
  if File.exist?(FILE_WITH_DATA)
    send_file FILE_WITH_DATA
  else
    NO_PAYLOAD_MESSAGE
  end
end

post '/payload' do
  request_paylod = request.body.read
  unless valid_json?(request_paylod)
    logger.info "Incorrect json received: #{request_paylod}"
    return
  end
  push = JSON.parse(request_paylod)
  File.open(FILE_WITH_DATA, 'w') do |f|
    f.write(JSON.pretty_generate(push))
  end
  CORRECT_PAYLOAD
end
