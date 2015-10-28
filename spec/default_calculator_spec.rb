require_relative '../calculator.rb'
require_relative '../default_calculator.rb'

describe 'default_calculator' do
  describe 'amount_of_monthly_repayment(month = nil)' do
    it 'should return an amount of the repayment per month' do
      calculator = DefaultCalculator.new(rate: 0.1, total_loan: 100_000, period_in_months: '6')

      expect(calculator.amount_of_monthly_repayment.round(2)).to eq(16_666.67)
    end
  end

  describe 'amount_of_interest_accrued(month)' do
    it 'should return an amount of interest accrued per month' do
      calculator = DefaultCalculator.new(rate: 0.1, total_loan: 100_000, period_in_months: '6')

      expect(calculator.amount_of_interest_accrued(2).round(2)).to eq(694.44)
    end
  end

  describe 'total_inpayment_per_month(month)' do
    it 'should return an amount of interest accrued per month' do
      calculator = DefaultCalculator.new(rate: 0.1, total_loan: 100_000, period_in_months: '6')

      expect(calculator.total_inpayment_per_month(2).round(2)).to eq(17_361.11)
    end
  end 

  describe 'loan_balance(month)' do
    it 'should return a loan balance per month' do
      calculator = DefaultCalculator.new(rate: 0.1, total_loan: 100_000, period_in_months: '6')

      expect(calculator.loan_balance(2).round(2)).to eq(66_666.67)
    end
  end 
end
