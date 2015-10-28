# gems
require 'rubygems'
require 'sinatra'
require 'haml'
require 'pry'

# files
require_relative 'calculator'
require_relative 'default_calculator'
require_relative 'equal_calculator'
require_relative 'helpers/my_helpers'

include MyHelpers

get '/calculator' do
  haml :calculator
end

get '/result' do
  rate = params[:rate]
  rate.tr!(',', '.') if rate.include?(',')
  rate = rate.to_f * 0.01
  total_loan = params[:total_loan]
  type = params[:type]
  period_in_months = params[:period_in_months]

  @calculator = case type
                when Calculator::PaymentType::DEFAULT
                  DefaultCalculator.new(rate: rate, total_loan: total_loan, period_in_months: period_in_months)
                when Calculator::PaymentType::EQUAL
                  EqualCalculator.new(rate: rate, total_loan: total_loan, period_in_months: period_in_months)
                end

  haml :result
end
