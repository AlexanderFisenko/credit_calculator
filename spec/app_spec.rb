require_relative '../app.rb'
require 'rack/test'

set :environment, :test

def app
  Sinatra::Application
end

describe 'app' do
  include Rack::Test::Methods

  it 'should load the /calculator page' do
    get '/calculator'

    expect(last_response).to be_ok
  end

  it 'should load the /result page' do
    get '/result?rate=10&total_loan=100000&type=default&period_in_months=6'

    expect(last_response).to be_ok
  end
end
