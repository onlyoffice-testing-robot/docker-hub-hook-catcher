# frozen_string_literal: true

require 'spec_helper'

describe 'My Sinatra Application' do
  before do
    FileUtils.rm_f(FILE_WITH_DATA)
  end

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

  it '/payload push should reject incorrect info' do
    post '/payload', 'incorrect json'
    expect(last_response).to be_ok
    expect(File.exist?(FILE_WITH_DATA)).to be_falsey
  end

  it '/payload push should receive correct info' do
    post '/payload', '{"a": "b"}'
    expect(last_response).to be_ok
    expect(last_response.body).to eq(CORRECT_PAYLOAD)
    expect(File.exist?(FILE_WITH_DATA)).to be_truthy
  end
end
