require 'spec_helper'

describe 'My Sinatra Application' do
  it 'should allow accessing the home page' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to eq(NO_PAYLOAD_MESSAGE)
  end

  it '/payload receive redirect accessing the payload page' do
    get '/payload'
    expect(last_response).to be_redirect
  end

  it '/payload should redirect in right place' do
    get '/payload'
    follow_redirect!
    expect(last_response).to be_ok
    expect(last_response.body).to eq(NO_PAYLOAD_MESSAGE)
  end
end
